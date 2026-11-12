#!/usr/bin/env python3
"""Local-only BFSS monograph release-candidate build and render driver.

It validates the source layout and PDF output, but never certifies theorem
truth, referee acceptance, or completed manual page-by-page inspection.
Requires latexmk, pdfinfo, pdftoppm, Python 3, Pillow, and a complete checkout.
"""
from __future__ import annotations

import argparse
import json
import re
import shutil
import subprocess
import sys
from pathlib import Path

from PIL import Image, ImageDraw, ImageFont


def invoke(args: list[str], cwd: Path, label: str) -> str:
    print(f'[{label}] ' + ' '.join(args), flush=True)
    result = subprocess.run(args, cwd=cwd, text=True,
                            stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    if result.returncode:
        print(result.stdout[-10000:])
        raise RuntimeError(f'{label} failed, exit {result.returncode}')
    return result.stdout


def page_count(info: str) -> int:
    match = re.search(r'^Pages:\s+(\d+)\s*$', info, re.MULTILINE)
    if match is None or int(match.group(1)) <= 0:
        raise RuntimeError('Could not verify the PDF page count')
    return int(match.group(1))


def make_sheets(images: list[Path], destination: Path, batch: int = 12) -> list[Path]:
    destination.mkdir(parents=True, exist_ok=True)
    outputs: list[Path] = []
    width, height, columns = 275, 380, 4
    for start in range(0, len(images), batch):
        pages = images[start:start + batch]
        rows = (len(pages) + columns - 1) // columns
        sheet = Image.new('RGB', (columns * (width + 16) + 16,
                                  rows * (height + 34) + 16), 'white')
        draw = ImageDraw.Draw(sheet)
        for offset, path in enumerate(pages):
            with Image.open(path) as im:
                im = im.convert('RGB')
                im.thumbnail((width, height))
                x = 16 + (offset % columns) * (width + 16)
                y = 16 + (offset // columns) * (height + 34)
                sheet.paste(im, (x + (width - im.width) // 2, y))
                draw.rectangle((x, y, x + width, y + height), outline='#777777')
                draw.text((x + 5, y + height + 6), f'Page {start + offset + 1}', fill='black')
        out = destination / f'contact_{start + 1:03d}_{start + len(pages):03d}.png'
        sheet.save(out)
        outputs.append(out)
    return outputs


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--root', type=Path,
                        default=Path(__file__).resolve().parents[1],
                        help='Complete manuscript directory containing main.tex')
    parser.add_argument('--outdir', type=Path,
                        default=Path('/tmp/bfss-monograph-rc'),
                        help='Build outputs outside the source checkout')
    parser.add_argument('--dpi', type=int, default=95)
    args = parser.parse_args()
    root = args.root.resolve()
    out = args.outdir.resolve()
    if args.dpi < 72 or args.dpi > 180:
        parser.error('--dpi must be between 72 and 180')
    for required in ('main.tex', 'tools/audit_manuscript.py',
                     'THEOREM_ATLAS.json', 'appendices/theorem_atlas.tex'):
        if not (root / required).is_file():
            raise RuntimeError(f'Incomplete source checkout: {root / required}')
    for command in ('latexmk', 'pdftoppm', 'pdfinfo'):
        if shutil.which(command) is None:
            raise RuntimeError(f'Missing local executable: {command}')
    out.mkdir(parents=True, exist_ok=True)
    audit = invoke([sys.executable, str(root / 'tools/audit_manuscript.py')],
                   root, 'structural audit')
    print(audit.strip())
    build_log = invoke(['latexmk', '-pdf', '-interaction=nonstopmode',
                        '-halt-on-error', '-file-line-error',
                        f'-outdir={out}', 'main.tex'], root, 'offline LaTeX')
    (out / 'latexmk_console.log').write_text(build_log, encoding='utf-8')
    pdf = out / 'main.pdf'
    log = out / 'main.log'
    if not pdf.is_file() or not log.is_file():
        raise RuntimeError('LaTeX build returned but main.pdf/log are absent')
    text = log.read_text(encoding='utf-8', errors='replace')
    blockers = []
    patterns = [r'(?m)^! ', r'(?m)^LaTeX Warning:',
                r'(?m)^Overfull \\[hv]box',
                r'(?i)undefined references', r'(?i)undefined citations',
                r'(?i)multiply defined labels', r'(?i)undefined control sequence']
    for pattern in patterns:
        matches = re.findall(pattern, text)
        if matches:
            blockers.append({'pattern': pattern, 'count': len(matches)})
    if blockers:
        (out / 'blocked_build.json').write_text(
            json.dumps(blockers, indent=2), encoding='utf-8')
        raise RuntimeError('TeX log contains unresolved warnings/errors; see blocked_build.json')
    info = invoke(['pdfinfo', str(pdf)], root, 'PDF information')
    total = page_count(info)
    render = out / 'rendered_pages'
    render.mkdir(exist_ok=True)
    invoke(['pdftoppm', '-r', str(args.dpi), '-png', str(pdf),
            str(render / 'page')], root, 'render every PDF page')
    images = sorted(render.glob('page-*.png'))
    if len(images) != total:
        raise RuntimeError(f'Rendered {len(images)} pages; PDF has {total}')
    sheets = make_sheets(images, out / 'contact_sheets')
    result = {
        'status': 'SOURCE_AND_RENDER_PASS__MANUAL_REVIEW_PENDING',
        'pdf': str(pdf), 'page_count': total,
        'audit_last_line': audit.strip().splitlines()[-1],
        'rendered_pages': len(images),
        'contact_sheets': [str(s) for s in sheets],
        'human_visual_review': 'NOT YET PERFORMED',
        'independent_mathematical_referee': 'NOT YET PERFORMED',
        'github_actions_or_hosted_compilers': 'NOT USED',
    }
    (out / 'build_manifest.json').write_text(
        json.dumps(result, indent=2), encoding='utf-8')
    print(json.dumps(result, indent=2))
    return 0


if __name__ == '__main__':
    try:
        raise SystemExit(main())
    except (RuntimeError, OSError) as error:
        print(f'BLOCKED: {error}', file=sys.stderr)
        raise SystemExit(1)
