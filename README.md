# AED-distribution-plot
plot the cumulative AED distribution controlling the quality of annotation for the final gene predictions 

# HOW-TO-USE
When we get the mark2 resultes like \*.protein.fa or \*.transcripts.fa, just follwing the command:

if you plot AED:
```bash
grep '>' *maker.proteins.fasta | awk '{print $1":"$4}' | perl -ne '@array=split(":", $_); @name=split("-",$array[0]);print $name[1]."\t".$array[2];' > Aed.output
```
if you plot eAED:
```bash
grep '>' *maker.proteins.fasta | awk '{print $1":"$5}' | perl -ne '@array=split(":", $_); @name=split("-",$array[0]);print $name[1]."\t".$array[2];' > eAed.output
```

Then you can use **Aed.output** and ```AED_distribution_plot.R``` to plot AED distribution

Figure：

<img src="https://github.com/LQHHHHH/AED-distribution-plot/blob/main/AED_dist.png"  alt="" align=center />

