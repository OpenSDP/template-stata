/******************************************************************************
Template for creating a Stata webdoc with table of contents
Author: OpenSDP
License: MIT
Prerequisites/Instructions: 
	1. Install Pandoc from https://github.com/jgm/pandoc/releases/tag/1.19.2.1
	2. Install the webdoc package (installed automatically below)
	3. Change the working directory in this file and save
	4. Change the working directory in run_webdoc.do and run it
	For more information on getting started with Webdoc, see 
	http://repec.sowi.unibe.ch/stata/webdoc/getting-started.html
*******************************************************************************/

// Check if webdoc is installed
capture which webdoc
if _rc==111 ssc install webdoc

// Change the path below to the working directory where you downloaded the template-stata repository
cd "C:\repositories\template-stata\"
clear all
set more off
set linesize 255

// Initialize webdoc - replace the document title and author's name in the command below
// stata_webdoc_template is the name of the markdown file that will be created
// You may change this name if you wish, but be sure to update it in run_webdoc.do
// The theme is simplex - to view other themes, see https://bootswatch.com/ 
webdoc init docs\stata_webdoc_template, replace md header(bstheme("journal", jscript) include("styles\styling.css") title(Stata Webdoc Template) author(OpenSDP))

// Creating html divs for content - will break if modified
webdoc put <div class="container"> // Start container for content and table of contents (TOC)
webdoc put <div class="row"> // Start row div for TOC and content
webdoc put <div class="col-xs-12 col-sm-12 col-md-4" style = "padding-right: 10px; padding-top: 50px;"> // Start column div for nav
webdoc put <div id="toc"></div> // Start and end table of contents div - this will be be populated with contents automatically
webdoc put </div> // End column div for nav
webdoc put <div class="col-xs-12 col-sm-12 col-md-8"> // Start column div for content

// All text and code starts here

/***

# Adding Text

## Regular Text
To create text for your web document, start a multi-line comment block using `/***` and end with `***/`.

***/

/***

## Headers and Table of Contents

Add headers to your web document by putting hash symbols before text inside comment blocks, e.g. `# Header 1`. 
The more hash symbols, the deeper the level in the table of contents and the smaller the header font size will be. All headers
will be added to the table of contents automatically

***/

/***

# Adding Code

You can indicate code in a different font within the text by using double tick marks, e.g. `` `some code here` ``. 
Code blocks run by Stata are added by putting regular lines of code in your .do file outside of 
the comment blocks. For more advanced options for adding and suppressing code, 
see the webdoc help file.

***/

// Example code 
di "Hello World!"

/***

# Generate Data or Use Your Own

Take advantage of the `OpenSDPsynthR` synthetic data by downloading a college-going
analysis file. Use the Stata `webuse` command to load the file. 

You can also generate a synthetic dataset based on your own data using the `synthpop` package in R.

***/

// These commands will download `OpenSDPsynthR` data into Stata from the College-Going Pathways repository.  
webuse set "https://github.com/opensdp/college-going-stata/raw/master/data/analysis/"
webuse "college_going_analysis.dta", clear 

/***

# Adding Graphs

You can use `webdoc graph` to add graphs to your webdoc. The example below 
is from OpenSDP's [College-Going Pathways](https://github.com/opensdp/college-going-stata) web guide series.  
***/

// High School Completion Rates by Average 8th Grade Achievement

// Keep students in ninth grade cohorts you can observe graduating high school AND have non-missing eighth grade math scores.
local chrt_ninth_begin = 2004
local chrt_ninth_end = 2006
keep if (chrt_ninth >= `chrt_ninth_begin' & chrt_ninth <= `chrt_ninth_end') & !mi(test_math_8_std)
 
// Obtain agency-level high school completion rate and prior achievement score along with the position of their labels.
summ ontime_grad
local agency_mean_grad = `r(mean)'*100
local agency_mean_grad_label = `agency_mean_grad' + 3
summ test_math_8_std
local agency_mean_test = `r(mean)'
local agency_mean_test_label = `agency_mean_test' + 0.15
 
// Obtain school-level high school completion and prior achievement rates
collapse (mean) test_math_8_std ontime_grad (count) N = sid, by(first_hs_code first_hs_name)
drop if N < 20
 
// Multiply the high school completion rate by 100 for graphical representation of the rates,
replace ontime_grad = round((ontime_grad * 100), .1)
 
// Shorten high school names and create a legend label for the graph
sort first_hs_name
replace first_hs_name = subinstr(first_hs_name, " High School", "", .)
gen hs_code_label = _n
 
levelsof first_hs_name, local(hs_names)
local count = 1
local legend_labels ""
foreach hs of local hs_names {
    local legend_labels `"`legend_labels' `count' = `hs'"' `" "'
    local ++count
}
 
// Prepare to graph the results
// Generate a cohort label to be used in the footnote for the graph
local temp_begin = `chrt_ninth_begin'-1
local temp_end = `chrt_ninth_end'-1
if `chrt_ninth_begin'==`chrt_ninth_end' {
    local chrt_label "`temp_begin'-`chrt_ninth_begin'"
} 
else {
    local chrt_label "`temp_begin'-`chrt_ninth_begin' through `temp_end'-`chrt_ninth_end'"
}
 
// Graph the results
#delimit ;
twoway (scatter ontime_grad test_math_8_std, mlabel(hs_code_label) mlabsize(vsmall)
    mlabposition(12) mlabcolor(dknavy) mstyle(x) msize(small) mcolor(dknavy)),
title("On-Time High School Graduation")
    subtitle("By Student Achievement Profile Upon High School Entry")
    xtitle("Average 8th Grade Math Standardized Score", linegap(0.3))
    ytitle("Percent of Ninth Graders")
    xscale(range(-0.8(0.2)1)) xlabel(-0.8(0.2)1)
    yscale(range(0(20)100)) ylabel(0(20)100, nogrid)
    legend(on order(3) col(1) label(3 `"`legend_labels'"')
    region(color(none)) size(vsmall) position(2) ring(1) linegap(.75))
yline(`agency_mean_grad', lpattern(dash) lcolor(dknavy) lwidth(vvthin))
xline(`agency_mean_test', lpattern(dash) lcolor(dkorange) lwidth(vvthin))
text(`agency_mean_grad_label' .8 "${agency_name} Average Graduation Rate", size(2.0) color(dknavy))
text(2 `agency_mean_test_label' "${agency_name} Average" "Test Score", size(2.0) color(dkorange))
text(99 -.5 "Below average math scores &" "above average graduation rates",
    size(vsmall) justification(left))
text(99 0.8 "Above average math scores &" "above average graduation rates",
    size(vsmall) justification(right))
text(2 -0.5 "Below average math scores &" "below average graduation rates",
    size(vsmall) justification(left))
text(2 0.8 "Above average math scores &" "below average graduation rates",
    size(vsmall) justification(right))
graphregion(color(white) fcolor(white) lcolor(white))
plotregion(color(white) fcolor(white) lcolor(white))
note("Sample: `chrt_label' ${agency_name} first-time ninth graders with eighth grade math test scores." "All data from ${agency_name} administrative records.", size(vsmall));
#delimit cr

graph export "figures/C2_HS_Grad_by_Avg_Eighth.png", replace width(1600) height(1200)
webdoc graph hs_grad_prior_ach, width(1600)

/***

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

***/

// All text and code ends here

webdoc put </div> // End column div for content
webdoc put </div> // End row div for TOC and content
webdoc put </div> // End container div for TOC and content

// Add the table of contents script last
webdoc append "js/tocify_scripts.txt"

webdoc close
