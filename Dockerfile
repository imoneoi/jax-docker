FROM python:3.12-slim-bookworm

# Install necessary packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    wget \
    curl \
    git \
    openssh-client \
    tmux \
    libxml2 \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install PyTorch, torchvision, torchaudio, and other requirements
COPY requirements.txt /tmp/requirements.torch_extensions
RUN pip3 install --no-cache-dir "jax[cuda12]" \
    && pip3 install --no-cache-dir -r /tmp/requirements/packages.txt \
    && rm -f /tmp/requirements.txt

# Set the default command to bash
ENTRYPOINT [ "/bin/bash" ]
