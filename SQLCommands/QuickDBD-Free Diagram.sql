-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/qJHyDh
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- DB Schema for Trend Analysis and Prediction

CREATE TABLE "Trend" (
    "TrendID" int   NOT NULL,
    "Item" int   NOT NULL,
    "Location" string   NOT NULL,
    "Media" string   NOT NULL,
    "Time" TIMESTAMP[]   NOT NULL,
    "Relevance" float[]   NOT NULL,
    "TrendAnalysis" int   NOT NULL,
    CONSTRAINT "pk_Trend" PRIMARY KEY (
        "TrendID"
     )
);

CREATE TABLE "TrendAnalysis" (
    "TrendAnalysisID" int   NOT NULL,
    "TrendID" int   NOT NULL,
    "TrendForexID" int   NULL,
    "Seasonality" boolean   NOT NULL,
    "SeasonalityTime" TIMESTAMP[]   NULL,
    "Microtrend" boolean   NOT NULL,
    "MicrotrendTime" TIMESTAMP[]   NULL,
    "TrendIncrease" boolean   NOT NULL,
    "Peaks" TIMESTAMP[]   NOT NULL,
    CONSTRAINT "pk_TrendAnalysis" PRIMARY KEY (
        "TrendAnalysisID"
     )
);

CREATE TABLE "Item" (
    "ItemID" int   NOT NULL,
    "Item" string   NOT NULL,
    "Category" string   NOT NULL,
    CONSTRAINT "pk_Item" PRIMARY KEY (
        "ItemID"
     )
);

CREATE TABLE "TrendForecasting" (
    "TrendForexID" int   NOT NULL,
    "TrendID" int   NOT NULL,
    "Time" TIMESTAMP[]   NOT NULL,
    "Relevance" float[]   NOT NULL,
    CONSTRAINT "pk_TrendForecasting" PRIMARY KEY (
        "TrendForexID"
     )
);

ALTER TABLE "TrendAnalysis" ADD CONSTRAINT "fk_TrendAnalysis_TrendAnalysisID_TrendID" FOREIGN KEY("TrendAnalysisID", "TrendID")
REFERENCES "Trend" ("TrendAnalysis", "TrendID");

ALTER TABLE "TrendAnalysis" ADD CONSTRAINT "fk_TrendAnalysis_TrendForexID" FOREIGN KEY("TrendForexID")
REFERENCES "TrendForecasting" ("TrendForexID");

ALTER TABLE "Item" ADD CONSTRAINT "fk_Item_ItemID" FOREIGN KEY("ItemID")
REFERENCES "Trend" ("Item");

ALTER TABLE "TrendForecasting" ADD CONSTRAINT "fk_TrendForecasting_TrendID" FOREIGN KEY("TrendID")
REFERENCES "Trend" ("TrendID");

