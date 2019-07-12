import pandas as pd
import os

def parse(path):
    df = pd.read_csv(os.path.join(path,"log_earliness.csv"))
    ds = os.path.basename(path) 
    print("write {}_test.csv".format(ds))
    print("write {}_train.csv".format(ds))
    df.loc[df["mode"]=="test"].to_csv("{}_test.csv".format(ds))
    df.loc[df["mode"]=="train"].to_csv("{}_train.csv".format(ds))

parse("test/ECG200")
parse("test/BavarianCrops")
