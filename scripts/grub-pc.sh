#!/bin/bash

grub-install --target=i386-pc --boot-directory=/scratch/mnt/boot --recheck /dev/vda
for d in dev proc sys; do mount -o bind /$d /scratch/mnt/$d; done
chroot /scratch/mnt/ /usr/sbin/grub-mkconfig -o /boot/grub/grub.cfg
for d in dev proc sys; do umount /scratch/mnt/$d; done
