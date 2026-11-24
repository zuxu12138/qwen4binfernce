
FROM pytorch/pytorch:2.6.0-cuda12.6-cudnn9-runtime

WORKDIR /workspace

ENV PYTHONUNBUFFERED=1
ENV HF_HOME=/workspace/.cache/huggingface
ENV PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True

RUN python -m pip install --no-cache-dir \
    transformers \
    accelerate \
    safetensors \
    sentencepiece \
    huggingface_hub \
    modelscope

RUN python -c "import torch; print(torch.__version__); print(torch.cuda.is_available())"

WORKDIR /workspace

CMD ["/bin/bash"]
