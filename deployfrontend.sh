rsync -r src/ docs/
rsync -r build/contracts/* docs/
git add .
git commit -m "Compile assets for Github Pages"
git push -u origin master