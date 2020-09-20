#!/bin/sh

set -ex

cd "$(dirname "$0")/.."

rm -rf docs

rev="$(git rev-parse HEAD)"

crystal doc --project-name=crystal-imgui-sfml --project-version='' --source-refname=master

cd docs

find . -type f -exec sed -i -r -e 's,<a href=".*index.html">,<a href="https://github.com/oprypin/crystal-imgui-sfml">,' {} \;

cat << EOF > index.html
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="refresh" content="1;url=ImGui/SFML.html"/>
    <title>Redirecting...</title>
    <script type="text/javascript">
        window.location.href = "ImGui/SFML.html";
    </script>
</head>
<body>
    <a href="ImGui/SFML.html">Redirecting...</a>
</body>
</html>
EOF
