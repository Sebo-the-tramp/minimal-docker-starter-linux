# notify library stuff
pip install pip install python-dotenv

# install micromind
cd micromind 
git checkout refactor
git pull
pip install -e .
cd ..

# install ultralytics
cd ultralytics
git config --global --add safe.directory /workspace/ultralytics
git checkout devel
pip install -e .
pip install ultralytics --upgrade 