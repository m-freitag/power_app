HTML('
<p> In our <a href="https://osf.io/preprints/socarxiv/9yuhp/download">paper</a> (Section 3.2), we provide similarly simple formulae for the case of AMCIEs and (non-causal) effect heterogeneity.</p>

<p><strong>While we offer some general guidance, chosing parameter values for a priori power analyses 
is highly dependent on the research question, on study goals, and on the consequences of incorrect descisions.</strong></p>

<p><strong>Note that testing for interaction effects, requires much larger sample sizes than testing for average effects.</strong></p>

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
        AMCIES
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordion">
      <div class="accordion-body">
        <p>Take two attributes \\(l, m\\) and treatment probabilities \\(p_{00} = P(W_{ijkl} = 0, W_{ijkm} = 0)\\), etc.
        If the interest is in causal interaction and uniform randomization is employed, then \\(p_{00} = p_{10} = p_{01} = p_{11} = 0.25\\) by design.</p>

        <p>For more info, see our <a href="https://osf.io/preprints/socarxiv/9yuhp/download">paper</a>, especially section 3.2.</p>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        (Non-causal) Effect Heterogeneity
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordion">
      <div class="accordion-body">
        <p>In the case of (non-causal) effect heterogeneity, researchers have to estimate the marginal distribution of the pre-treatment covariate, e.g., using prior studies. 
        As the treatments are independent from the co-variate, the joint probabilities, \\(p_{00}, p_{10}, p_{01}, p_{11}\\) are then simply obtained by taking the product of the marginal covariate distribution and the treatment distribution. 
        For instance, in the case of a binary individual-level co-variate with \\(P(W_{ijkm} = 1) = 0.6\\), the resulting probabilities become:
        \\(p_{00} = 0.5 \\cdot 0.4 = 0.2\\), \\(p_{10} = 0.5 \\cdot 0.4 = 0.2\\), \\(p_{01} = 0.5 \\cdot 0.6 = 0.3\\), \\(p_{11} = 0.5 \\cdot 0.6 = 0.3\\).</p>

        <p>For more info, see our <a href="https://osf.io/preprints/socarxiv/9yuhp/download">paper</a>, especially section 3.2.</p>
      </div>
    </div>
  </div>
</div>
')