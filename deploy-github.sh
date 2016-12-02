# Clone gh-pages
git clone git@github.com:leeds-dart/leeds-dart.github.io.git gh-pages
pushd gh-pages
git checkout -t origin/master

# Out with the old in with the new
rm -rf *
# Copy build
cp -r ../build/web/* .

# Add and commit
git add -A
git commit -m "Update build files"
git push
popd

rm -rf gh-pages
