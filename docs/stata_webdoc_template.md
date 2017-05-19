<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone=no">
<title>Stata Webdoc Template</title>
<meta name="author" content="OpenSDP">
<link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/journal/bootstrap.min.css" rel="stylesheet" integrity="sha384-1L94saFXWAvEw88RkpRz8r28eQMvt7kG9ux3DdCqya/P3CfLNtgqzMnyaUa49Pl2" crossorigin="anonymous">
<style>
img { max-width: 100%; height: auto; }
pre { word-break: normal; word-wrap: normal; }
code { color: inherit; background-color: #F5F5F5; }
pre code, pre samp { white-space: pre; }
</style>
<link type="text/css" rel="stylesheet" href="styles/jquery.tocify.css" />

<style>

li.tocify-item.active a {
  color: white !important;
  background-color: #121212 !important;
}

a.tocify-item.active {
  color: white !important;
  background-color: #121212 !important;
}

.tocify {
    width: 20%;
    max-height: 90%;
    overflow: auto;
    margin-left: 2%;
    position: fixed;
    border: 1px solid #ccc;
    webkit-border-radius: 6px;
    moz-border-radius: 6px;
    border-radius: 6px;
}

/* The Table of Contents is composed of multiple nested unordered lists.  These styles remove the default styling of an unordered list because it is ugly. */
.tocify ul, .tocify li {
    list-style: none;
    margin: 0;
    padding: 0;
    border: none;
    line-height: 30px;
}

/* Top level header elements */
.tocify-header {
    text-indent: 10px;
}

/* Top level subheader elements.  These are the first nested items underneath a header element. */
.tocify-subheader {
    text-indent: 20px;
    display: none;
}

/* Makes the font smaller for all subheader elements. */
.tocify-subheader li {
    font-size: 12px;
}

/* Further indents second level subheader elements. */
.tocify-subheader .tocify-subheader {
    text-indent: 30px;
}

/* Further indents third level subheader elements. You can continue this pattern if you have more nested elements. */
.tocify-subheader .tocify-subheader .tocify-subheader {
    text-indent: 40px;
}

/* Twitter Bootstrap Override Style */
.nav-list > li > a, .nav-list .nav-header {
    margin: 0px;
}

</style>
<style>
.stcmd .stcmt { font-style: italic; opacity: 0.5; }
.stoom, .stcnp { font-style: italic; }
@media screen { .stcnp { display: none; }}
</style>
</head>
<body>
<div class="container">
<div class="row">
<div class="col-xs-12 col-sm-12 col-md-4" style = "padding-right: 10px; padding-top: 50px;">
<div id="toc"></div>
</div>
<div class="col-xs-12 col-sm-12 col-md-8">

# Adding Text

## Regular Text
To create text for your web document, start a multi-line comment block using `/***` and end with `***/`.


## Headers and Table of Contents

Add headers to your web document by putting hash symbols before text inside comment blocks, e.g. `# Header 1`. 
The more hash symbols, the deeper the level in the table of contents and the smaller the header font size will be. All headers
will be added to the table of contents automatically


# Adding Code

You can indicate code in a different font within the text by using double tick marks, e.g. `` `some code here` ``. 
Code blocks run by Stata are added by putting regular lines of code in your .do file outside of 
the comment blocks. For more advanced options for adding and suppressing code, 
see the webdoc help file.


# Generate Data or Use Your Own

Take advantage of the `OpenSDPsynthR` synthetic data by downloading a college-going
analysis file. Use the Stata `webuse` command to load the file. 

You can also generate a synthetic dataset based on your own data using the `synthpop` package in R.


# Adding Graphs

You can use `webdoc graph` to add graphs to your webdoc. The example below 
is from OpenSDP's [College-Going Pathways](https://github.com/opensdp/college-going-stata) web guide series.  
<figure id="fig-hs_grad_prior_ach">
<a href="hs_grad_prior_ach.png"><img alt="hs_grad_prior_ach.png" src="hs_grad_prior_ach.png"/></a>
</figure>

# Ideas for Starting Your Analysis

You should feel free to create and annotate your project as you see fit. However,
if you have trouble getting started here's an example outline for describing your project.
We suggest providing some text with code about how you pulled your data together.
Then, unlock the power of webdocs by providing additional text on the context and reasoning
behind your analyses.

## Clean the Data

In this section, describe the process you use to clean the data, organize the variables, 
and apply business rules for data consistency.

## Connect the Data

In this section, describe how you combine data from different levels of aggregation 
and compute calculated variables to create a data set (or data sets) suitable for analysis.

## Analyze the Data

In this section, describe your analyses and show the code you used to complete each analysis. 
Include diagnostic plots, summary tables, and model output.

## Report the Results

In this section, make your final results available. Include explanatory graphics that you 
would use in a presentation. Include ways of demonstrating the substantive impact of your 
results.

</div>
</div>
</div>
<script src="js/jquery.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="https://npmcdn.com/tether@1.2.4/dist/js/tether.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.tocify.js"></script> 
 
<script> 
	//Executes your code when the DOM is ready.  Acts the same as $(document).ready().
	jQuery(document).ready(function ($) {
		 $("#toc").tocify({ theme: "bootstrap", highlightOnScroll: true, highlightDefault: true});
	});
</script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>
