# Use a base image with Jupyter Notebook pre-installed
FROM quay.io/jupyter/base-notebook

# Copy the requirements.txt file into the container
COPY requirements.txt /tmp/

# Install the packages listed in requirements.txt
RUN pip install -r /tmp/requirements.txt

# Set a working directory inside the container
WORKDIR /home/personal-well-being-dashboard/work

# Copy your existing notebook into the working directory
COPY well-being-notebook.ipynb /home/personal-well-being-dashboard/work/

# Expose the port for Jupyter Notebook
EXPOSE 8888

# Start the Jupyter Notebook server with a custom token
CMD ["start-notebook.py", "--NotebookApp.token='my-token'"]