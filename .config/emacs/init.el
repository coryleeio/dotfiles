(when (< emacs-major-version 29)
  (error (format "This config only works with Emacs 29 and newer; you have version ~a" emacs-major-version)))

(org-babel-load-file
 (expand-file-name
  "config.org"
  user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("9d5124bef86c2348d7d4774ca384ae7b6027ff7f6eb3c401378e298ce605f83a" "df6dfd55673f40364b1970440f0b0cb8ba7149282cf415b81aaad2d98b0f0290" "34cf3305b35e3a8132a0b1bdf2c67623bc2cb05b125f8d7d26bd51fd16d547ec" "56044c5a9cc45b6ec45c0eb28df100d3f0a576f18eef33ff8ff5d32bac2d9700" "00cec71d41047ebabeb310a325c365d5bc4b7fab0a681a2a108d32fb161b4006" "2b501400e19b1dd09d8b3708cefcb5227fda580754051a24e8abf3aff0601f87" "88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e" "e14884c30d875c64f6a9cdd68fe87ef94385550cab4890182197b95d53a7cf40" "2721b06afaf1769ef63f942bf3e977f208f517b187f2526f0e57c1bd4a000350" "dccf4a8f1aaf5f24d2ab63af1aa75fd9d535c83377f8e26380162e888be0c6a9" "9dccdccfeb236623d5c7cf0250a92308cf307afde4ebdaf173b59e8bbbae1828" "c1d5759fcb18b20fd95357dcd63ff90780283b14023422765d531330a3d3cec2" "13096a9a6e75c7330c1bc500f30a8f4407bd618431c94aeab55c9855731a95e1" "680f62b751481cc5b5b44aeab824e5683cf13792c006aeba1c25ce2d89826426" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "f053f92735d6d238461da8512b9c071a5ce3b9d972501f7a5e6682a90bf29725" "631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b" "02d422e5b99f54bd4516d4157060b874d14552fe613ea7047c4a5cfa1288cf4f" "5f128efd37c6a87cd4ad8e8b7f2afaba425425524a68133ac0efd87291d05874" "89d9dc6f4e9a024737fb8840259c5dd0a140fd440f5ed17b596be43a05d62e67" "bf948e3f55a8cd1f420373410911d0a50be5a04a8886cabe8d8e471ad8fdba8e" "013728cb445c73763d13e39c0e3fd52c06eefe3fbd173a766bfd29c6d040f100" "9d29a302302cce971d988eb51bd17c1d2be6cd68305710446f658958c0640f68" "f4d1b183465f2d29b7a2e9dbe87ccc20598e79738e5d29fc52ec8fb8c576fcfd" "3de5c795291a145452aeb961b1151e63ef1cb9565e3cdbd10521582b5fd02e9a" "29b4f767c48da68f8f3c2bbf0dde2be58e4ed9c97e685af5a7ab7844f0d08b8b" "8d8207a39e18e2cc95ebddf62f841442d36fcba01a2a9451773d4ed30b632443" "b54376ec363568656d54578d28b95382854f62b74c32077821fdfd604268616a" "0d0936adf23bba16569c73876991168d0aed969d1e095c3f68d61f87dd7bab9a" "8c7e832be864674c220f9a9361c851917a93f921fedb7717b1b5ece47690c098" "93011fe35859772a6766df8a4be817add8bfe105246173206478a0706f88b33d" "be84a2e5c70f991051d4aaf0f049fa11c172e5d784727e0b525565bb1533ec78" "e4a702e262c3e3501dfe25091621fe12cd63c7845221687e36a79e17cf3a67e0" "162201cf5b5899938cfaec99c8cb35a2f1bf0775fc9ccbf5e63130a1ea217213" "3cdd0a96236a9db4e903c01cb45c0c111eb1492313a65790adb894f9f1a33b2d" "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "6945dadc749ac5cbd47012cad836f92aea9ebec9f504d32fe89a956260773ca4" "944d52450c57b7cbba08f9b3d08095eb7a5541b0ecfb3a0a9ecd4a18f3c28948" "636b135e4b7c86ac41375da39ade929e2bd6439de8901f53f88fde7dd5ac3561" "1f669e8abe4dc2855268c9a607b5e350e2811b3c5afd09af5939ff0c01a89c5a" default))
 '(warning-suppress-log-types '(((elpaca-use-package-compat)) (comp) (bytecomp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe ((t :background "unspecified-bg")))
 '(header-line ((t :box (:line-width 4 :color "unspecified-bg" :style nil))))
 '(header-line-highlight ((t :box (:color "unspecified-fg"))))
 '(keycast-key ((t)))
 '(line-number ((t :background "unspecified-bg")))
 '(mode-line ((t :box (:line-width 6 :color "unspecified-bg" :style nil))))
 '(mode-line-active ((t :box (:line-width 6 :color nil :style nil))))
 '(mode-line-highlight ((t :box (:color "unspecified-fg"))))
 '(mode-line-inactive ((t :box (:line-width 6 :color nil :style nil))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.7))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.6))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.5))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.4))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.3))))
 '(org-level-6 ((t (:inherit outline-5 :height 1.2))))
 '(org-level-7 ((t (:inherit outline-5 :height 1.1))))
 '(tab-bar-tab ((t :box (:line-width 4 :color "grey" :style nil))))
 '(tab-bar-tab-inactive ((t :box (:line-width 4 :color "grey" :style nil))))
 '(window-divider ((t :background "unspecified-bg" :foreground "unspecified-bg")))
 '(window-divider-first-pixel ((t :background "unspecified-bg" :foreground "unspecified-bg")))
 '(window-divider-last-pixel ((t :background "unspecified-bg" :foreground "unspecified-bg"))))
