# ===== Engine & options =====
$pdflatex = 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';
$biber    = 'biber %O %S';
$pdf_mode = 1;

# ===== Where to put outputs =====
$out_dir = 'build';
$aux_dir = 'build';