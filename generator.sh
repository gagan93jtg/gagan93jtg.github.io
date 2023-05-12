cd jekyll_blog
rm -rf _site .jekyll-cache
bundle exec jekyll build
cd ..
rm -rf blog
mkdir -p blog
cp -R jekyll_blog/_site/* blog/
git add .
git ci -m "Script: Generated site"
