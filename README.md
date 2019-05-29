
# More for Less: Adaptive Labeling Payments in Online Labor Markets

<!-- badges: start -->

![Language](https://img.shields.io/badge/Language-R%20\(3.4.3\)-green.svg)
<!-- badges: end -->

## Synopsis

In many predictive tasks where human intelligence is needed to label
training instances, online crowdsourcing markets have emerged as
promising platforms for large-scale, cost-effective labeling.

However, these platforms also introduce significant challenges that must
be addressed for these opportunities to materialize.

In particular, it has been shown that different tradeoffs between
payment offered to labelers and the quality of labeling arise at
different times, possibly as a result of different market conditions and
even the nature of the tasks themselves.

Because the underlying mechanism giving rise to different tradeoffs is
not well understood, for any given labeling task and at any given time,
it is not known what labeling payments to offer in the market so as to
cost-effectively produce accurate models.

Importantly, because in these markets the acquired labels are not always
correct, determining the expected effect of labels acquired at any given
payment on the improvement in model performance is particularly
challenging.

Effective and robust methods for dealing with these challenges are
essential to enable a growing reliance on these promising and
increasingly popular labor markets for large-scale labeling.

In this paper, we first present this new problem of Adaptive Labeling
Payment (ALP): how to learn and sequentially adapt the payment offered
to crowd labelers before they undertake a labeling task, so as to
produce a given predictive performance cost-effectively.

We then develop an ALP approach and discuss the key challenges it aims
to address to yield consistently good performance.

We extensively evaluate our approach over a wide variety of market
conditions.

Our results demonstrate that the ALP method we propose yields
significant cost savings and robust performance across different
settings.

As such, our ALP approach can be used as a benchmark for future
mechanisms to determine cost-effective selection of labeling payments.

## Reproducing the Paper Results

This project was developed and tested under R 3.4.3 for Windows which
you can get
[here](https://cran.r-project.org/bin/windows/base/old/3.4.3/).

All the project essential R packages will be installed automatically
when you first launch the code.

The installed packages versions are exactly as they existed when the
code was developed and tested.

While the project may work on newer versions of R and its packages, we
can only guarantee the reproducibility of the results when the
conditions above are met.

## How to Run

1.  Download the project from GitHub and unpack it into a local
    directory.
2.  Open R or RStudio and set the working directory to the project root
    folder.
3.  Run **main.R** under the *\~/code* folder.

## How it Works

### Inputs

Configuration and execution of the simulations are coded in two separate
files: *config.yml* and *main.R*. Both files are under the *\~/code*
folder.

The configuration file defines the dataset, scenario and simulation
nuances via [yaml tags](https://yaml.org/spec/1.2/spec.html#id2761292).
The tags are accompanied by explanations about what they define.

The script file named *main.R*, initializes and runs the simulation
without further modification needed.

### Algorithm

See the paper for details about the different algorithms.

## Output

Upon successful completion, each simulation outputs three files (see
[Appendix](#appendix)):

1.  [A report table](#report-table) under *\~/results/reports*
2.  [A metadata table](#metadata-table) under *\~/results/metadata*
3.  [A ledger table](#ledger-table) under *\~/results/ledgers*

While there is some overlap between the tables, the *report* table
serves as the most succinct debrief. The other two tables are exposed
the observer to the decision making process of the algorithm. *metadata*
and *ledger* provide details on what happened on an instance-level and
batch-level,
respectively.

## Appendix

### Report table

<table class="table table-striped table-hover table-condensed" style="font-size: 10px; ">

<thead>

<tr>

<th style="text-align:right;">

instance\_num

</th>

<th style="text-align:right;">

pay

</th>

<th style="text-align:right;">

change

</th>

<th style="text-align:right;">

cost\_so\_far

</th>

<th style="text-align:right;">

AUC\_holdout

</th>

<th style="text-align:right;">

full\_AUC

</th>

<th style="text-align:right;">

subset\_AUC

</th>

<th style="text-align:left;">

updated\_label

</th>

<th style="text-align:right;">

batch

</th>

<th style="text-align:right;">

repetition

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:right;">

330

</td>

<td style="text-align:right;">

0.14

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

49.7

</td>

<td style="text-align:right;">

0.99

</td>

<td style="text-align:right;">

0.75

</td>

<td style="text-align:right;">

0.00

</td>

<td style="text-align:left;">

level2

</td>

<td style="text-align:right;">

33

</td>

<td style="text-align:right;">

2

</td>

</tr>

<tr>

<td style="text-align:right;">

330

</td>

<td style="text-align:right;">

0.14

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

49.7

</td>

<td style="text-align:right;">

0.99

</td>

<td style="text-align:right;">

0.75

</td>

<td style="text-align:right;">

0.01

</td>

<td style="text-align:left;">

level2

</td>

<td style="text-align:right;">

33

</td>

<td style="text-align:right;">

2

</td>

</tr>

<tr>

<td style="text-align:right;">

330

</td>

<td style="text-align:right;">

0.14

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

49.7

</td>

<td style="text-align:right;">

0.99

</td>

<td style="text-align:right;">

0.75

</td>

<td style="text-align:right;">

0.01

</td>

<td style="text-align:left;">

level2

</td>

<td style="text-align:right;">

33

</td>

<td style="text-align:right;">

2

</td>

</tr>

<tr>

<td style="text-align:right;">

340

</td>

<td style="text-align:right;">

0.14

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

51.1

</td>

<td style="text-align:right;">

0.99

</td>

<td style="text-align:right;">

0.75

</td>

<td style="text-align:right;">

0.00

</td>

<td style="text-align:left;">

level2

</td>

<td style="text-align:right;">

34

</td>

<td style="text-align:right;">

2

</td>

</tr>

<tr>

<td style="text-align:right;">

340

</td>

<td style="text-align:right;">

0.14

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

51.1

</td>

<td style="text-align:right;">

0.99

</td>

<td style="text-align:right;">

0.75

</td>

<td style="text-align:right;">

0.00

</td>

<td style="text-align:left;">

level2

</td>

<td style="text-align:right;">

34

</td>

<td style="text-align:right;">

2

</td>

</tr>

<tr>

<td style="text-align:right;">

340

</td>

<td style="text-align:right;">

0.14

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

51.1

</td>

<td style="text-align:right;">

0.99

</td>

<td style="text-align:right;">

0.75

</td>

<td style="text-align:right;">

0.01

</td>

<td style="text-align:left;">

level2

</td>

<td style="text-align:right;">

34

</td>

<td style="text-align:right;">

2

</td>

</tr>

</tbody>

</table>

<br>

### Metadata table

<table class="table table-striped table-hover table-condensed" style="font-size: 10px; ">

<thead>

<tr>

<th style="text-align:right;">

instance\_num

</th>

<th style="text-align:right;">

pay

</th>

<th style="text-align:right;">

change

</th>

<th style="text-align:right;">

cost\_so\_far

</th>

<th style="text-align:right;">

AUC\_holdout

</th>

<th style="text-align:left;">

full\_AUC

</th>

<th style="text-align:left;">

subset\_AUC

</th>

<th style="text-align:left;">

updated\_label

</th>

<th style="text-align:right;">

batch

</th>

<th style="text-align:left;">

svm\_bug

</th>

<th style="text-align:right;">

repetition

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:right;">

335

</td>

<td style="text-align:right;">

0.14

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

50.40

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:left;">

NA

</td>

<td style="text-align:left;">

NA

</td>

<td style="text-align:left;">

level2

</td>

<td style="text-align:right;">

34

</td>

<td style="text-align:left;">

NA

</td>

<td style="text-align:right;">

2

</td>

</tr>

<tr>

<td style="text-align:right;">

336

</td>

<td style="text-align:right;">

0.14

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

50.54

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:left;">

NA

</td>

<td style="text-align:left;">

NA

</td>

<td style="text-align:left;">

level1

</td>

<td style="text-align:right;">

34

</td>

<td style="text-align:left;">

NA

</td>

<td style="text-align:right;">

2

</td>

</tr>

<tr>

<td style="text-align:right;">

337

</td>

<td style="text-align:right;">

0.14

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

50.68

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:left;">

NA

</td>

<td style="text-align:left;">

NA

</td>

<td style="text-align:left;">

level2

</td>

<td style="text-align:right;">

34

</td>

<td style="text-align:left;">

NA

</td>

<td style="text-align:right;">

2

</td>

</tr>

<tr>

<td style="text-align:right;">

338

</td>

<td style="text-align:right;">

0.14

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

50.82

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:left;">

NA

</td>

<td style="text-align:left;">

NA

</td>

<td style="text-align:left;">

level1

</td>

<td style="text-align:right;">

34

</td>

<td style="text-align:left;">

NA

</td>

<td style="text-align:right;">

2

</td>

</tr>

<tr>

<td style="text-align:right;">

339

</td>

<td style="text-align:right;">

0.14

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

50.96

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:left;">

NA

</td>

<td style="text-align:left;">

NA

</td>

<td style="text-align:left;">

level1

</td>

<td style="text-align:right;">

34

</td>

<td style="text-align:left;">

NA

</td>

<td style="text-align:right;">

2

</td>

</tr>

<tr>

<td style="text-align:right;">

340

</td>

<td style="text-align:right;">

0.14

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

51.10

</td>

<td style="text-align:right;">

0.99

</td>

<td style="text-align:left;">

NA

</td>

<td style="text-align:left;">

NA

</td>

<td style="text-align:left;">

level2

</td>

<td style="text-align:right;">

34

</td>

<td style="text-align:left;">

NA

</td>

<td style="text-align:right;">

2

</td>

</tr>

</tbody>

</table>

<br>

### Ledger table

<table class="table table-striped table-hover table-condensed" style="font-size: 10px; ">

<thead>

<tr>

<th style="text-align:right;">

repetition

</th>

<th style="text-align:right;">

batch

</th>

<th style="text-align:right;">

batch\_size

</th>

<th style="text-align:left;">

payment\_selection\_criteria

</th>

<th style="text-align:right;">

payment\_selected

</th>

<th style="text-align:right;">

AUC\_holdout\_set

</th>

<th style="text-align:right;">

AUC\_full\_train\_set

</th>

<th style="text-align:right;">

AUC\_partial\_train\_set\_1

</th>

<th style="text-align:right;">

AUC\_partial\_train\_set\_2

</th>

<th style="text-align:right;">

AUC\_partial\_train\_set\_3

</th>

<th style="text-align:right;">

AUC\_train\_set\_delta\_1

</th>

<th style="text-align:right;">

AUC\_train\_set\_delta\_2

</th>

<th style="text-align:right;">

AUC\_train\_set\_delta\_3

</th>

<th style="text-align:right;">

expected\_performance\_1

</th>

<th style="text-align:right;">

expected\_performance\_2

</th>

<th style="text-align:right;">

expected\_performance\_3

</th>

<th style="text-align:right;">

expected\_total\_cost\_1

</th>

<th style="text-align:right;">

expected\_total\_cost\_2

</th>

<th style="text-align:right;">

expected\_total\_cost\_3

</th>

<th style="text-align:right;">

total\_ratio\_1

</th>

<th style="text-align:right;">

total\_ratio\_2

</th>

<th style="text-align:right;">

total\_ratio\_3

</th>

<th style="text-align:left;">

safety\_net

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:right;">

2

</td>

<td style="text-align:right;">

29

</td>

<td style="text-align:right;">

10

</td>

<td style="text-align:left;">

max\_total\_ratio

</td>

<td style="text-align:right;">

0.14

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:left;">

NA

</td>

</tr>

<tr>

<td style="text-align:right;">

2

</td>

<td style="text-align:right;">

30

</td>

<td style="text-align:right;">

10

</td>

<td style="text-align:left;">

max\_total\_ratio

</td>

<td style="text-align:right;">

0.02

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:right;">

NA

</td>

<td style="text-align:left;">

NA

</td>

</tr>

<tr>

<td style="text-align:right;">

2

</td>

<td style="text-align:right;">

31

</td>

<td style="text-align:right;">

10

</td>

<td style="text-align:left;">

max\_total\_ratio

</td>

<td style="text-align:right;">

0.14

</td>

<td style="text-align:right;">

0.98

</td>

<td style="text-align:right;">

0.74

</td>

<td style="text-align:right;">

0.74

</td>

<td style="text-align:right;">

0.73

</td>

<td style="text-align:right;">

0.74

</td>

<td style="text-align:right;">

0.00

</td>

<td style="text-align:right;">

0.01

</td>

<td style="text-align:right;">

0.01

</td>

<td style="text-align:right;">

\-1e+08

</td>

<td style="text-align:right;">

0.75

</td>

<td style="text-align:right;">

0.75

</td>

<td style="text-align:right;">

45.7

</td>

<td style="text-align:right;">

46.9

</td>

<td style="text-align:right;">

48.0

</td>

<td style="text-align:right;">

\-2188184

</td>

<td style="text-align:right;">

0.02

</td>

<td style="text-align:right;">

0.02

</td>

<td style="text-align:left;">

FALSE

</td>

</tr>

<tr>

<td style="text-align:right;">

2

</td>

<td style="text-align:right;">

32

</td>

<td style="text-align:right;">

10

</td>

<td style="text-align:left;">

max\_total\_ratio

</td>

<td style="text-align:right;">

0.14

</td>

<td style="text-align:right;">

0.99

</td>

<td style="text-align:right;">

0.75

</td>

<td style="text-align:right;">

0.75

</td>

<td style="text-align:right;">

0.74

</td>

<td style="text-align:right;">

0.74

</td>

<td style="text-align:right;">

\-0.01

</td>

<td style="text-align:right;">

0.01

</td>

<td style="text-align:right;">

0.00

</td>

<td style="text-align:right;">

\-1e+08

</td>

<td style="text-align:right;">

0.76

</td>

<td style="text-align:right;">

0.75

</td>

<td style="text-align:right;">

47.1

</td>

<td style="text-align:right;">

48.3

</td>

<td style="text-align:right;">

49.4

</td>

<td style="text-align:right;">

\-2123142

</td>

<td style="text-align:right;">

0.02

</td>

<td style="text-align:right;">

0.02

</td>

<td style="text-align:left;">

FALSE

</td>

</tr>

<tr>

<td style="text-align:right;">

2

</td>

<td style="text-align:right;">

33

</td>

<td style="text-align:right;">

10

</td>

<td style="text-align:left;">

max\_total\_ratio

</td>

<td style="text-align:right;">

0.14

</td>

<td style="text-align:right;">

0.99

</td>

<td style="text-align:right;">

0.75

</td>

<td style="text-align:right;">

0.76

</td>

<td style="text-align:right;">

0.74

</td>

<td style="text-align:right;">

0.74

</td>

<td style="text-align:right;">

0.00

</td>

<td style="text-align:right;">

0.01

</td>

<td style="text-align:right;">

0.01

</td>

<td style="text-align:right;">

\-1e+08

</td>

<td style="text-align:right;">

0.77

</td>

<td style="text-align:right;">

0.76

</td>

<td style="text-align:right;">

48.5

</td>

<td style="text-align:right;">

49.7

</td>

<td style="text-align:right;">

50.8

</td>

<td style="text-align:right;">

\-2061856

</td>

<td style="text-align:right;">

0.02

</td>

<td style="text-align:right;">

0.02

</td>

<td style="text-align:left;">

FALSE

</td>

</tr>

<tr>

<td style="text-align:right;">

2

</td>

<td style="text-align:right;">

34

</td>

<td style="text-align:right;">

10

</td>

<td style="text-align:left;">

max\_total\_ratio

</td>

<td style="text-align:right;">

0.14

</td>

<td style="text-align:right;">

0.99

</td>

<td style="text-align:right;">

0.75

</td>

<td style="text-align:right;">

0.75

</td>

<td style="text-align:right;">

0.75

</td>

<td style="text-align:right;">

0.75

</td>

<td style="text-align:right;">

0.00

</td>

<td style="text-align:right;">

0.00

</td>

<td style="text-align:right;">

0.01

</td>

<td style="text-align:right;">

\-1e+08

</td>

<td style="text-align:right;">

0.76

</td>

<td style="text-align:right;">

0.76

</td>

<td style="text-align:right;">

49.9

</td>

<td style="text-align:right;">

51.1

</td>

<td style="text-align:right;">

52.2

</td>

<td style="text-align:right;">

\-2004008

</td>

<td style="text-align:right;">

0.01

</td>

<td style="text-align:right;">

0.01

</td>

<td style="text-align:left;">

FALSE

</td>

</tr>

</tbody>

</table>
