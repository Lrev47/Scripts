#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y upgrade

apt-get install -y python3-pip
python3 -m pip install --upgrade pip setuptools

rm -rf /workspace/ComfyUI
rm -rf /workspace/venv

cd /workspace
git clone --depth=1 https://github.com/comfyanonymous/ComfyUI.git

cd ComfyUI
python3 -m venv /workspace/venv

source /workspace/venv/bin/activate
/workspace/venv/bin/python -m ensurepip --upgrade
/workspace/venv/bin/python -m pip install --upgrade pip setuptools

pip install --upgrade pip setuptools
pip install --no-cache-dir torch==2.1.2+cu118 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
pip install --no-cache-dir xformers==0.0.23.post1+cu118 --index-url https://download.pytorch.org/whl/cu118
pip install -r requirements.txt

git clone https://github.com/ltdrdata/ComfyUI-Manager.git custom_nodes/ComfyUI-Manager
cd custom_nodes/ComfyUI-Manager
pip install -r requirements.txt

pip install huggingface_hub runpod

cd /workspace/ComfyUI/models/checkpoints
wget https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned.safetensors
wget -O deliberate_v2.safetensors https://huggingface.co/XpucT/Deliberate/resolve/main/Deliberate_v2.safetensors
wget https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors
wget https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0.safetensors

cd /workspace/ComfyUI/models/vae
wget https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors
wget https://huggingface.co/madebyollin/sdxl-vae-fp16-fix/resolve/main/sdxl_vae.safetensors

cd /workspace/ComfyUI/models/controlnet
wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_openpose.pth
wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_canny.pth
wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11f1p_sd15_depth.pth
wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_inpaint.pth
wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_lineart.pth
wget https://huggingface.co/ioclab/ioc-controlnet/resolve/main/models/control_v1p_sd15_brightness.safetensors
wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11f1e_sd15_tile.pth

wget https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/diffusers_xl_canny_full.safetensors

cd /workspace/ComfyUI/models/upscale_models
wget https://huggingface.co/ashleykleynhans/upscalers/resolve/main/4x-UltraSharp.pth
wget https://huggingface.co/ashleykleynhans/upscalers/resolve/main/lollypop.pth

mkdir -p /workspace/logs
