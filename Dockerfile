FROM mohamedrez/maktaba_base:0.0.1

ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
