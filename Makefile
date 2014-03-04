
UNITY = /home/sam/Documenten/Samwise/Unity
CMOCK = /home/sam/Documenten/Samwise/CMock

CFLAGS = -I./mocks -I$(UNITY)/src -I$(CMOCK)/src -I./ -ggdb

demo: 
	@echo "\n-------Generating mock with --ignore=args_only-------\n"
	@mkdir -p mocks
	ruby $(CMOCK)/lib/cmock.rb --ignore=args_only --plugins="expect;expect_any_args;ignore" dothing.h
	ruby $(UNITY)/auto/generate_test_runner.rb Testdemo.c
	gcc $(CFLAGS) -o $@ Testdemo.c ./mocks/Mockdothing.c $(UNITY)/src/unity.c $(CMOCK)/src/cmock.c Testdemo_Runner.c

clean:
	rm -rfv *.o ./mocks/ demo ./Testdemo_Runner.c
