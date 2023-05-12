rm -rf blog
mkdir -p blog
cp -R jekyll_blog/_site/* blog/
git ci -am "Script: Generated site"
