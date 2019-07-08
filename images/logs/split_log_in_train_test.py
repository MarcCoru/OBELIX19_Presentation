import pandas as pd
import sys

filename, ext = sys.argv[1].split(".")

data = pd.read_csv(sys.argv[1])
data.loc[data["mode"]=="train"].to_csv(filename+"_train."+ext)
data.loc[data["mode"]=="test"].to_csv(filename+"_test."+ext)
