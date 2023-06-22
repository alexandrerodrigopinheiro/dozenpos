APP_NAME = veloz-pdv


.PHONY: release debug clean run install

release:
	@echo release building...
	@fvm flutter clean
	@fvm flutter build apk --split-per-abi --no-sound-null-safety --release
	@rm -f ../builds/${APP_NAME}.apk
	@cp build/app/outputs/flutter-apk/app-armeabi-v7a-release.apk ../builds/${APP_NAME}.apk
	@echo  done.


debug:
	@echo  debug building...
	@fvm flutter clean
	@fvm flutter build apk --no-sound-null-safety --debug
	@rm -f ../builds/${APP_NAME}-debug.apk
	@cp build/app/outputs/flutter-apk/app-debug.apk ../builds/${APP_NAME}-debug.apk
	@echo  done.


clean:
	@echo  building...
	@fvm flutter clean
	@echo  done.


run:
	@echo  building...
	@fvm flutter run --debug
	@echo  done.


install:
	@echo  building...
	fvm flutter run --no-sound-null-safety --release
	@echo  done.
