#!/bin/sh
if [ -z "$1" ]
  then
    echo "I would supply a user personally"
    exit 1;
fi
#Lets keep the ugly URL's around for now
#hugo --uglyURLs=true  --theme=nc_theme -d _site  --baseURL="https://necurity.co.uk";
hugo  --theme=nc_theme -d _site  --baseURL="https://necurity.co.uk/";
echo "Finished Site Generation"

echo "Minififization begin"
#find _site  -name "*.html" -exec sed  -i '/^\(\s*\)\/\//d' {} \;
#find _site  -name "*.html" -exec sed  -i 's/^[ \t]*//g; s/[ \t]*$//g;' {} \;
#find _site  -name "*.html" -exec sed  -i ':a;N;$!ba;s/\n/ /g' {} \;
#find _site  -name "*.html" -exec sed  -i 's/> *</></g' {} \;
#find _site  -name "*.css" -exec sed -i '/^\(\s*\)\/\//d' {} \;
#find _site  -name "*.css" -exec sed -i 's/^[ \t]*//g; s/[ \t]*$//g;' {} \;
#find _site  -name "*.css" -exec sed -i ':a;N;$!ba;s/\n/ /g' {} \;

echo "done"
echo ""

scp -r _site/* .htaccess $1@10.8.66.1:/home/$1/www/public
#rsync -avPz -e ssh _site/ $1@lg.lc:/home/$1/www/public --size-only 
