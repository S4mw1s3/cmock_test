
UNITY = /home/sam/Documenten/Samwise/Unity
CMOCK = /home/sam/Documenten/Samwise/CMock

CFLAGS = -I./mocks -I$(UNITY)/src -I$(CMOCK)/src -I./

all: default args_only 

default: 
	@echo "\n-------Generating mock with default settings-------\n"
	@mkdir -p mocks
	ruby $(CMOCK)/lib/cmock.rb --plugins="expect;ignore" dothing.h
	ruby $(UNITY)/auto/generate_test_runner.rb Testdemo.c
	gcc $(CFLAGS) -o $@ demo.c Testdemo.c ./mocks/Mockdothing.c $(UNITY)/src/unity.c $(CMOCK)/src/cmock.c Testdemo_Runner.c

args_only: 
	@echo "\n-------Generating mock with --ignore=args_only-------\n"
	@mkdir -p mocks
	ruby $(CMOCK)/lib/cmock.rb --ignore=args_only --plugins="expect;ignore" dothing.h
	ruby $(UNITY)/auto/generate_test_runner.rb Testdemo.c
	gcc $(CFLAGS) -o $@ demo.c Testdemo.c ./mocks/Mockdothing.c $(UNITY)/src/unity.c $(CMOCK)/src/cmock.c Testdemo_Runner.c

clean:
	rm -rfv *.o ./mocks/ default args_only ./Testdemo_Runner.c
