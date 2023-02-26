HTML('
<p>  Based on recent advances in statistical inference for factorial experiments, we derive simple yet
generally applicable formulae to calculate power and minimum required sample sizes in forced-choice conjoint experiments. </p>

<p><strong>While we offer some general guidance, chosing parameter values for a priori power analyses 
is highly dependent on the research question, on study goals, and on the consequences of incorrect descisions. </strong></p>

<div class="accordion" id="accordion">
<div class="accordion-item">
    <h2 class="accordion-header" id="headingZero">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseZero" aria-expanded="false" aria-controls="collapseZero">
        Why evaluate power?
      </button>
    </h2>
    <div id="collapseZero" class="accordion-collapse collapse" aria-labelledby="headingZero" data-bs-parent="#accordion">
      <div class="accordion-body">
Evaluating statistical power prior to
conducting a study is important for the credibility and replicability of later findings. Studies
with low power are not only less likely to detect truly existing effects, but they also have
higher Type S (incorrect sign) and Type M (overestimation of effect magnitude) error rates
and, in sum, cumulate in a larger share of false positives in the published literature (Gelman
and Carlin, 2014; Smaldino and McElreath, 2016).
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
        How do I chose effect sizes?
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordion">
      <div class="accordion-body">
        See our <a href="https://osf.io/preprints/socarxiv/9yuhp/download">paper</a>, especially section 4.
        See also the recent paper by <a href="https://gking.harvard.edu/files/gking/files/conerr.pdf">Clayton et al. (2023)</a> on measurement error in conjoint experiments.
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        Power Analysis for AMCEs 
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordion">
      <div class="accordion-body">
        The power formulae we derive build on results from the experimental and causal inference literature, as well as on arguments about clustering by Abadie et al. 2017. More details can be found in the <a href="https://osf.io/preprints/socarxiv/9yuhp/download">paper</a>.
      </div>
    </div>
  </div>
</div>
')