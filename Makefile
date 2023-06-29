APP_NAME = rapidinha-pdv


.PHONY: release run


release:
	@echo  debug building...
	@fvm flutter clean
	@fvm flutter build web --no-sound-null-safety --web-renderer auto --release
	@echo  done.


run:
	@echo  running...
	@fvm flutter run -d chrome --no-sound-null-safety --web-renderer auto --profile
	@echo  done.
