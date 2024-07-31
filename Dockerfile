# Use a base image with Jupyter Notebook pre-installed
FROM quay.io/jupyter/base-notebook

# Set a working directory inside the container
WORKDIR /home/personal-well-being-dashboard/work

# Expose the port for Jupyter Notebook
EXPOSE 8888

# Start the Jupyter Notebook server with a custom token
CMD ["start-notebook.py", "--NotebookApp.token='my-token'"]