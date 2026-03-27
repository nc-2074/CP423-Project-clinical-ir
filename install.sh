#!/bin/bash
# install.sh
# ----------
# Install all dependencies in the correct order

set -e  # stop on first error

echo ""
echo "========================================================"
echo " Clinical IR System — Dependency Installer"
echo "========================================================"
echo ""

# ── Step 1: Core ML / audio ───────────────────────────────────────────
echo "[1/6] Installing PyTorch (Apple Silicon with Metal support)..."
pip install torch torchaudio

echo ""
echo "[2/6] Installing pyannote and Groq..."
pip install "pyannote.audio>=4.0.4" "groq>=0.9.0"

# ── Step 2: MLX (Apple Silicon only) ─────────────────────────────────
echo ""
echo "[3/6] Installing MLX for MedGemma..."
pip install "mlx-lm>=0.22.0"

# ── Step 3: LiveKit — install compatible versions ────────────────────
echo ""
echo "[4/6] Installing LiveKit core..."
pip install "livekit>=1.0.0" "livekit-api>=1.0.0"

echo ""
echo "[5/6] Installing LiveKit agents and plugins..."
pip install "livekit-agents>=1.5.0"
pip install "livekit-plugins-silero>=0.7.0"
pip install "livekit-plugins-groq>=1.0.0"

# ── Step 4: Everything else ───────────────────────────────────────────
echo ""
echo "[6/6] Installing remaining dependencies..."
pip install \
    "sentence-transformers>=2.7.0" \
    "supabase>=2.28.0" \
    "flask>=3.0.0" \
    "flask-cors>=4.0.0" \
    "requests>=2.31.0" \
    "numpy>=2.0,<3.0" \
    "pandas>=2.0.0" \
    "scikit-learn>=1.3.0" \
    "python-dotenv>=1.0.0" \
    "pydub>=0.25.1" \
    "huggingface_hub>=0.28.1" \
    "transformers>=4.48.0" \
    "tokenizers>=0.21"

echo ""
echo "========================================================"
echo " Installation complete!"
echo "========================================================"
