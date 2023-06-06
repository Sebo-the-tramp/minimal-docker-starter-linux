cd micromind 
pip install -e .
cd ..

cd utlralytics
git config --global --add safe.directory /workspace/ultralytics
git checkout devel

cd ultralytics
python debugging.py
cd ..

python notify.py