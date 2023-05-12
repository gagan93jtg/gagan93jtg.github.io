rm -rf blog
mkdir -p blog
cp -R jekyll_blog/_site/* blog/
git add .
git ci -m "Script: Generated site"
