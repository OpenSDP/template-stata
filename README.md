# OpenSDPsynthR Analysis Template (Stata)
Stata folder structure, data and webdoc template for using output from the OpenSDPsynthR synthetic data generator for education analytics.

## Purpose
This Stata template project has three main objectives:
1. Introduce a method to create html files of your Stata code and explanatory text using the Stata `webdoc` package. 
Using `webdoc` is a great way to improve the accessibility of your code and transparency of your analysis. Preview the template [here](http://htmlpreview.github.io/?https://github.com/opensdp/template-stata/blob/master/docs/stata_webdoc_template.html).
2. Show how to access the `OpenSDPsynthR` synthetic data from within Stata. (Though, feel free to use your own data!)
3. Provide an example of a file structure you can use to keep your project organized. 

## Getting Started
1. Clone or download the `template-stata` repository.
2. [Download](https://github.com/jgm/pandoc/releases/tag/1.19.2.1) and install Pandoc. 
3. Install the webdoc package `ssc install webdoc` or allow our .do file to install it for you automatically.
4. Open programs/stata_webdoc_template.do in the Stata .do file editor. Change the working directory in this file and save it.
5. Open programs/run_webdoc.do in the Stata .do file editor. Change the working directory and run it.
6. Open docs/stata_webdoc_template.html in your web browser.
7. Get to work on your project! 

When you're done, you have the option to upload your work to Github. After uploading, you can share your html file using 
the [html preview tool](https://htmlpreview.github.io/).

## About
These materials were originally authored by the Strategic Data Project.

[OpenSDP](https://opensdp.github.io) is an online, public repository of analytic
code, tools, and training intended to foster collaboration among education
analysts and researchers in order to accelerate the improvement of our school
systems. The community is hosted by the
[Strategic Data Project](https://sdp.cepr.harvard.edu), an initiative of the
[Center for Education Policy Research at Harvard University](https://cepr.harvard.edu).
We welcome contributions and feedback.
