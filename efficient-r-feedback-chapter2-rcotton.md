## General points

I think it's worth making an effort between distinguishing the bits of book that are how-to tips, and the bits that are explaining underlying concepts.

- Tips have now been extracted and put separate.

You also need to sell some ideas harder.  For example, describe a problem that some your advice then solves.  For example, I'm a lousy typist, and autocomplete means fewer typos.  Or, R has a lots of functions, and remembering their names can be a nightmare.  This is where `apropos` and `??` come in useful.

- `apropos` and `??` are covered in Chapter 6 (yet to be reviewed). There definitely should be something about the importance of touch typing for efficient programming - not sure if this is best placed in Chapter 1, 4 or 9 but we've added an issue to add it.

On a similar theme, you need to explain when ideas will be useful.  I guess the point of the book is persuade people to change their working habits, so just giving them ideas on what can be done isn't enough.  You need to tell them "if you are doing this task, then use this idea not that one".

It would also be great if you had a summary of tips for lazy people who can't be bothered to read the whole chapter.  A "top ten tips" at the start of each chapter would be magnificent.

- A 'top 5' tips has been added

The other thing is that it isn't entirely clear who the target audience is.  There are some things targeted at total beginners (like the section on how to install R), and some things that get into technical issues (like how `.Rprofile` files are searched for).  You either need to be consistent about who you target, or mark different bits of content as suitable for beginners/advanced users, so readers can quickly find the content that is appropriate for them.

- We've made the decision that each chapter should go from easy to hard and that is now clarified in the introductory text which reads "Starting with the basics and moving to progressively more advanced topics, we explore how the operating system,
R version, startup files and IDE can make your R work faster (though IDE could be seen as basic need for efficient programming)."

## Section 2.1

> p7 "R works on all three major operating systems"

Solaris is also an official platform.  At least packages submitted to CRAN are tested on Solaris.

- Thanks for flagging this. Text now reads: "R works on all three consumer operating systems (OS) (Linux, Mac and Windows)
as well as the server-orientated Solaris OS." - seem OK?

> p7 "R is predominantly platform-independent"

It's worth a discussion of which bits of code aren't platform independent (anything involving locales, some time zones, some environment variables, character encoding).  This also seems like a good time to mention the *assertive.reflection* package, which has functions for checking which operating system you are running (`assert_is_solaris` or `assert_is_osx_el_capitan`, etc.), as well as which IDE you are using (`assert_is_rstudio`, etc.), the capabilities of R (`assert_r_has_libcurl_capability` etc.), and what OS tools are available (`assert_r_can_compile_code`, etc.).

- A 'pro tip' on this subject has been added - thanks for flagging it.

### Section 2.1.1 

When would you want to do OS resource monitoring? I can see this being useful for people managing servers, but for general users I think you need to sell some use cases.

- I've added the following explanation: "If you only process small datasets, system monitoring may not be necessary but when handling datasets at the limits of your computer's resources, it can be a useful tool for identifying bottlenecks, such as when you are running low on RAM."

## Section 2.2

> p9 "It is important to keep your R installation and packages up-to-date"

It depends upon context.  For most analysis work, this is true.  There are quite a few R packages on Bioconductor that contain copies of omics databases, and different versions of R packages contain slightly different datasets, and you usually want to keep these fixed for the duration of a project, so your results dont change half way through.  When R is embedded in some other application (for example providing server-side data analysis for a web app), you probably want to be more convsersative about updating.

- Agreed, I've updated the text accordingly, e.g.: "For most use cases it we recommend always using the most up-to-date version of R and packages, so you have the latest code.
In some circumstances (e.g. on a production server) you may alternatively want to use specific versions"

Maybe worth mentioning *packrat*, *miniCRAN* and other package version management tools.

- A tip on R versions has been added. Not added anything on **miniCRAN** as yet.

### Section 2.2.1 

It seems quite late in the book to only just be talking about installing R.

- Fair point but I think it's the right place. We now refer to it in Chapter 1 (not yet published) and the intro of C2 (`(skip to section \@ref(r-version)`).

### Section 2.2.3 and Section 2.2.5

`update.packages` is mentioned in both sections, which seems redundant.  Also worth mentioning putting `update.packages(ask = FALSE)` in your .RProfile to keep everything up to date.

- The first (redundant) mention of `update.packages` has been removed

- `update.packages(ask = FALSE)` is now mentioned in relation to `.Rprofile` (providing a taster of what is to come), in a tip that references you!: To update packages automatically, you can add the line `update.packages(ask = FALSE)` to your
`.Rprofile` startup file (see the next section for more on `.Rprofile`). Thanks to Richard Cotton for this tip.

## Section 2.3

Command args don't seem to be mentioned.  I speed up startup using `"--quiet --no-save --no-restore"` options.  Full documentation is in Appendix B of R-intro.

- This has been added. I wondered how to set these in RStudio but could find little online documentation so just described these arguments in general terms. Any further feedback in this area gratefully received.

The introduction to this section quickly gets bogged down in technical details.  I think it is more important to describe what the purpose of each file is, and the sorts of things that you might want to put inside them.

- This is a good point - the introduction now provides a brief overview of each file before getting bogged down in technicalities.

You can more easily find the location of all these files using the *pathological* package and `example(startup)`.

### Section 2.3.2

Just suggesting to read a help file isn't that useful.  And the help page is called "Startup".

#### Section 2.3.2.1

I also like `options(continue = "  ")` to make it easier to copy from the command line and paste to the editor.

#### Section 2.3.2.4 

I define a few shortcuts for utility functions that are a commonly used but a pain to type. (`tr <- traceback`, `br <- browser`, `v <- utils::View`). 

### Section 2.3.3

You need to discuss when you would use an `.Renviron` file over setting the environment variable permanently in the OS, and using `Sys.setenv`.

> p15 "Another common use of .Renviron is to store API keys"

I suppose a more mainstream example is to store github authentication tokens to use with `devtools::install_github`.  Or does this come in the Efficient Collaboration chapter?

## Section 2.4

I'm not sure that a quick how to guide for RStudio is much use.  I'd prefer a discussion of the choices of IDE (pretty much RStudio vs. Architect vs. Revolution R Enterprise vs. emacs+ESS).  For example, if you develop in multiple languages, then Architect or emacs is a better choice because they aren't tied to the R language.  Where you mention RStudio, you could reference John Verzani's "Getting Started with RStudio" which has more detail on this sort of step-by-step how to stuff.

Are there any tips on how to configure the IDE to make it more efficient?

### Section 2.4.6

> p20 "Ctl+Z/Shift+Z: Undo/Redo"

Redo is Ctrl +Y.  Also, calling the Ctrl key Ctl weirds me out a bit.

> p20 "‘Slots’ are sub-elements of an object"

Worth clarifying that they are elements of an S4 object.

### Section 2.4.8

> p22 "Another approach to project management is to treat projects as R packages"

I've tried doing data analysis inside R packages, and it's awful.  When you are exploring data, you want to create lots of smaller scripts to explore different questions, and much of the code is disposable, and the emphasis is on speed of exploration.  If you work inside a package you spend too much time getting bogged down in running R CMD check and trying to make things pretty.

Packages are for more permanent code.  So creating a package of your final analysis is a great idea, and creating packages for utility stuff to reuse between projects is great, but they aren't suitable for everything.

> p22 " Creating R packages is easier than ever before" 

Maybe recommend Chapter 17 of "Learning R" (by me) and Hadley W.'s "R Packages". A step by step example of how to create a package programmatically would also be useful.

## Section 2.5

> p22 "By switching to a different BLAS library, it may be possible to speed-up your R code"

Show don't tell.  It would be nice to see an example or two of how much speed up you can get.  I don't have a feel for whether this will give a 10% speed boost or a 10-fold speed boost.  Which kinds of problems will changing this most affect?

Also, getting set up to use this seems to be the main obstacle, so giving an outline of where to start would be helpful.


### Section 2.5.2

Google have taken over development of CXXR, another interpreter based on C++.

> p23 "mentioning Julia"

You are welcome to quote me as describing Julia as *MATLAB for hipsters*.


### Section 2.5.4

Ex1. How do you find this out?

