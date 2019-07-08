rsync /data/EV2019/test/BavarianCrops/log_earliness.csv data/early_reward/
python split_log_in_train_test.py data/early_reward/log_earliness.csv

rsync /data/EV2019/twophasecrossentropy/BavarianCrops/log_earliness.csv data/twophasecrossentropy/
python split_log_in_train_test.py data/twophasecrossentropy/log_earliness.csv
