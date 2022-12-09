#!/bin/bash
sudo efibootmgr --disk /dev/nvme0n1 --part 1 --create --label "ARCH" --loader /arch/vmlinuz-linux --unicode 'nvidia-drm.modeset=1 nowatchdog amd_iommu=on systemd.restore_state=0 iommu=pt root=/dev/nvme0n1p5 rootflags=subvolid=313 rw loglevel=3 quiet splash fbcon=nodefer initrd=\\arch\\amd-ucode.img initrd=\\arch\\initramfs-linux.img' --verbose



#rd.luks.key=cebf5d7b-1ecd-450b-a4b5-51a7ffcb062c=/key:UUID=5ad3611a-a9bc-467f-803e-41803a9b7f81 rd.luks.options=cebf5d7b-1ecd-450b-a4b5-51a7ffcb062c=keyfile-timeout=5s
