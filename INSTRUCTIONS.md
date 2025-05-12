**Step 1**

Put the Dockerfile and the input (paired_end.qza)  in the same directory.

I have uploaded both files to this repo, you can pull it to your mac. 

**Step 2**

Cd to the same directory with the input files and the Dockerfile

**Step 3**

Now build image using the following code in the terminal:

```
docker build \
  --platform linux/amd64 \
  -t qiime2-amplicon:2024.10 \
  .
```

**Step 4**

Launch an interactive QIIME2 container using the following code:

```
docker build \
  --platform linux/amd64 \
  -t qiime2-amplicon:2024.10 \
  .
```

**Step 5**

Run an example dada2 code:

```
qiime dada2 denoise-paired \
  --i-demultiplexed-seqs paired_end.qza \
  --p-trunc-len-f 248 \
  --p-trunc-len-r 233 \
  --p-trim-left-f 19 \
  --p-trim-left-r 23 \
  --p-n-threads 0 \
  --o-table feature_table.qza \
  --o-representative-sequences representative_seqs.qza \
  --o-denoising-stats dada2_stats.qza
```
Above is an example code, but you can use other qiime commands. 

After the code finishes you should see the three outs in your working directory (I mean the same dir with the Dockerfile).

**Step 6**

Exit the container.

Just type exit in the terminal and press return.

