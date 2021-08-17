CONTAINERBOUND_ID := "17vOMQsAK7gyVd4Kyk-cLeC3HFlkdo2rSkrjKVDkW-mKBpvtEYs54RPST"
CONTAINERBOUND_ROOTDIR := "containerboundscripts"
STANDALONE_ID := "1pdZJ0OBqSndXchvP0oW2j2bwb86PR5WwfSDw58UCNon6Ik-IHZenf7WK"
STANDALONE_ROOTDIR := "standalonescripts"
LIB_ID := $(STANDALONE_ID)
PROJECT_ID := "sankakuproxy"
CLASP := npx clasp

.PHONY: clean
clean:
	rm .clasp.json


.PHONY: pre-push-conatiner
pre-push-conatiner:
	cat .clasp.base.json | jq '.scriptId|=$(CONTAINERBOUND_ID)' | jq '.rootDir|=$(CONTAINERBOUND_ROOTDIR)' | jq '.projectId|=$(PROJECT_ID)' > .clasp.json

.PHONY: push-container
push-container: pre-push-conatiner
	$(CLASP) push -f

.PHONY: pre-push-standalone
pre-push-standalone:
	cat .clasp.base.json | jq '.scriptId|=$(STANDALONE_ID)' | jq '.rootDir|=$(STANDALONE_ROOTDIR)' | jq '.projectId|=$(PROJECT_ID)' > .clasp.json

.PHONY: push-standalone
push-standalone: pre-push-standalone
	$(CLASP) push -f


