CFLAGS=-static -O2

davinciresolve-rocky: pkexec
	docker buildx build -t ghcr.io/shachar/davinciresolve-rocky:latest .

pkexec: pkexec.c

rocky-8.6:
	docker import https://github.com/rocky-linux/sig-cloud-instance-images/raw/Rocky-8.6.20220515-x86_64-Base/Rocky-8-Container-x86_64-Base.tar.xz rocky-8.6

rocky-8.6-minimal:
	docker import https://github.com/rocky-linux/sig-cloud-instance-images/raw/Rocky-8.6.20220515-x86_64-Minimal/Rocky-8-Container-x86_64-Minimal.tar.xz rocky-8.6-minimal

docker-push: davinciresolve-rocky
	cat .token | docker login ghcr.io -u shachar --password-stdin
	docker push ghcr.io/shachar/davinciresolve-rocky:latest
