echo "Deleting ComfyUI"
rm -rf /workspace/ComfyUI

echo "Deleting venv"
rm -rf /workspace/venv

echo "Cloning ComfyUI repo to /workspace"
cd /workspace
git clone --depth=1 https://github.com/comfyanonymous/ComfyUI.git

echo "Installing Ubuntu updates"
apt update
apt -y upgrade