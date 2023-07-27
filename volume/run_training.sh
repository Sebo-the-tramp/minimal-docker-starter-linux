cd micromind/
pip install -e .
cd recipes/detection
python detection.py > ../../../log.txt
cd ../../../

python notify.py