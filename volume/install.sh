# notify library stuff
pip install pip install python-dotenv

# install micromind
cd micromind 
pip install -e .
cd ..

# install ultralytics
cd utlralytics
git config --global --add safe.directory /workspace/ultralytics
git checkout devel

# start training
cd ultralytics
python debugging.py
cd ..

# notify finish
python notify.py