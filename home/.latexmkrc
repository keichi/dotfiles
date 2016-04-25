$latexargs          = '-synctex=1 -halt-on-error';
$latexsilentargs    = $latexargs . ' -interaction=batchmode';
$latex            = 'platex ' . $latexargs;
$latex_silent     = 'platex ' . $latexsilentargs;
$dvipdf           = 'dvipdfmx %O -o %D %S';
$bibtex           = 'pbibtex';
$makeindex        = 'mendex %O -o %D %S';
$max_repeat       = 5;
$pdf_mode         = 3;

