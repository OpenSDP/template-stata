// Change the path below to the working directory where you downloaded the template-stata repository
cd "C:\repositories\template-stata\"

// Run webdoc - markdown
webdoc do programs\stata_webdoc_template.do

// Convert markdown to html
shell pandoc stata_webdoc_template.md -s -o stata_webdoc_template.html
