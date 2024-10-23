#!/bin/bash

if [ -d ".venv" ]; then
    echo "Activating virtual environment..."
    source .venv/bin/activate    
else
    echo "Creating new virtual environment..."
    python3 -m venv .venv
    echo "Activating virtual environment..."
    source .venv/bin/activate
fi