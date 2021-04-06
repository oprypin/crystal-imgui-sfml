#!/usr/bin/python

import os, os.path
import re
import subprocess


os.chdir(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

with open("Makefile") as f:
    content = f.read()

for line in subprocess.check_output("git submodule status --recursive".split()).splitlines():
    m = re.search(r"\b([0-9a-f]+) ([^ ]+) ", line.decode())
    assert m
    content, n = re.subn(
        r"\b[0-9a-f]+(\.tar.+-C ?" + m[2] + r")$", m[1] + r"\1", content, flags=re.MULTILINE
    )
    assert n == 1

with open("Makefile", "w") as f:
    f.write(content)
