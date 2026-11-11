# Objective
Ingest raw TCGA (The Cancer Genome Atlas) clinical and gene expression tracking files, build relational tables using SQL, engineer wide-to-tall architecture, and connect the data to Power BI to build a genomic dashboard.

# TCGA Multi-Cancer Genomic Data Architecture & Power BI Dashboard

An end-to-end bioinformatics data engineering and visualization project integrating transcriptomic gene expression data with clinical cancer classifications from The Cancer Genome Atlas (TCGA). This repository documents the data transformation pipeline, wide-to-tall matrix unpivoting, relational schema modeling, and an interactive Power BI clinical dashboard.

---

## Executive Summary

Raw genomic expression datasets present a major structural challenge: thousands of gene columns arranged in a wide matrix layout. This structure prevents efficient relational querying, dynamic filtering, and seamless aggregation in business intelligence tools.

To solve this, raw TCGA matrices were ingested and transformed in **Power Query** using an **Unpivot** transformation to build a unified, tall relational dataset named **`cancer_req`**. This unpivoted dataset enables dynamic gene expression analysis across multiple cancer types, powering heatmaps, average expression distributions, and slicer-driven cohort exploration.

---

## Data Pipeline & Architecture
Raw TCGA Gene Expression & Clinical Metadata]
│
▼
[Power Query ETL & Unpivot Transformation]
(Converted Wide Matrix -> Tall Dataset)
│
▼
[Unified cancer_req Table]
(sample_id | cancer_type | gene_symbol | expression_value)
│
▼
[Interactive Power BI Dashboard]
(Gene Heatmap | Expression Bar Chart | Cancer Slicer)

 **Extraction & Ingestion:** 
Loaded wide-format TCGA transcriptomic matrices containing gene expression values alongside patient clinical annotations.

2. **Matrix Unpivoting:** Applied Power Query's `Unpivot Columns` transformation to convert gene columns into key-value pairs (`gene_symbol`, `expression_value`).

3. **Table Consolidation:** Consolidated data into a single, highly performant dataset named `cancer_req`.

4. **Interactive Dashboarding:** Constructed a high-impact dashboard with a multi-cancer gene expression heatmap, average expression bar charts, and dynamic cancer type slicers.

## Dashboard Features (Power BI)

# Gene Expression Matrix Heatmap: A visual matrix representing expression levels across various cancer types, identifying overexpressed and underexpressed biomarkers at a glance.
# Average Expression Bar Chart: Quantifies mean expression values for top target genes across selected cohorts.
# Dynamic Cancer Type Slicer: Allows interactive single- and multi-select filtering to update all visuals instantaneously.
