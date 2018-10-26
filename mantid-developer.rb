class MantidDeveloper < Formula
  include Language::Python::Virtualenv
  # get the pyport.patch file as we need it later and just because we have to have one
  # this is really a metapackage only
  url 'https://raw.githubusercontent.com/mantidproject/mantid/master/buildconfig/pyport.patch' #:using => :curl
  homepage "https://github.com/mantidproject/mantid/wiki/Building-Mantid-on-OS-X-10.9-&-10.10-using-clang-and-Xcode"
  version '1.1'
  sha256 "e9f83c057e70082c48f5576d3e7d0d257f55f1835ce659239c64445bb01da551"

  depends_on "openssl"
  depends_on "qt@4"
  depends_on "qt"
  depends_on "cmake"
  depends_on "ninja"
  depends_on "sip"
  depends_on "pkg-config"
  depends_on "pyqt@4" => "with-python"
  depends_on "qscintilla2qt4"
  depends_on "poco"
  depends_on "boost"
  depends_on "boost-python"
  depends_on "gsl"
  depends_on "hdf5"
  depends_on "h5py"
  depends_on "libmxml"
  depends_on "muparser"
  depends_on "nexusformat"
  depends_on "jsoncpp"
  depends_on "tbb"
  depends_on "opencascade"
  depends_on "openssl"
  depends_on "qwt5"
  depends_on "qwtplot3d"
  depends_on "gperftools"
  depends_on "librdkafka"
  depends_on "python@2"
  depends_on "python"
  depends_on "numpy"
  depends_on "scipy"
  depends_on "freetype"
  depends_on "clang-format"

  resource "alabaster" do
    url "https://files.pythonhosted.org/packages/cc/b4/ed8dcb0d67d5cfb7f83c4d5463a7614cb1d078ad7ae890c9143edebbf072/alabaster-0.7.12.tar.gz"
    sha256 "a661d72d58e6ea8a57f7a86e37d86716863ee5e92788398526d58b26a4e4dc02"
  end

  resource "Babel" do
    url "https://files.pythonhosted.org/packages/be/cc/9c981b249a455fa0c76338966325fc70b7265521bad641bf2932f77712f4/Babel-2.6.0.tar.gz"
    sha256 "8cba50f48c529ca3fa18cf81fa9403be176d374ac4d60738b839122dfaaa3d23"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/41/b6/4f0cefba47656583217acd6cd797bc2db1fede0d53090fdc28ad2c8e0716/certifi-2018.10.15.tar.gz"
    sha256 "6d58c986d22b038c8c0df30d639f23a3e6d172a05c3583e766f4c0b785c0986a"
  end

  resource "chardet" do
    url "https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz"
    sha256 "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"
  end

  resource "docutils" do
    url "https://files.pythonhosted.org/packages/84/f4/5771e41fdf52aabebbadecc9381d11dea0fa34e4759b4071244fa094804c/docutils-0.14.tar.gz"
    sha256 "51e64ef2ebfb29cae1faa133b3710143496eca21c530f3f71424d77687764274"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/65/c4/80f97e9c9628f3cac9b98bfca0402ede54e0563b56482e3e6e45c43c4935/idna-2.7.tar.gz"
    sha256 "684a38a6f903c1d71d6d5fac066b58d7768af4de2b832e426ec79c30daa94a16"
  end

  resource "imagesize" do
    url "https://files.pythonhosted.org/packages/41/f5/3cf63735d54aa9974e544aa25858d8f9670ac5b4da51020bbfc6aaade741/imagesize-1.1.0.tar.gz"
    sha256 "f3832918bc3c66617f92e35f5d70729187676313caa60c187eb0f28b8fe5e3b5"
  end

  resource "Jinja2" do
    url "https://files.pythonhosted.org/packages/56/e6/332789f295cf22308386cf5bbd1f4e00ed11484299c5d7383378cf48ba47/Jinja2-2.10.tar.gz"
    sha256 "f84be1bb0040caca4cea721fcbbbbd61f9be9464ca236387158b0feea01914a4"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/cf/50/1f10d2626df0aa97ce6b62cf6ebe14f605f4e101234f7748b8da4138a8ed/packaging-18.0.tar.gz"
    sha256 "0886227f54515e592aaa2e5a553332c73962917f2831f1b0f9b9f4380a4b9807"
  end

  resource "pyparsing" do
    url "https://files.pythonhosted.org/packages/1a/e2/4a7ad8f2808e03caebd3ec0a250b4afbb26d4ba063c39c3286185dd06dd1/pyparsing-2.2.2.tar.gz"
    sha256 "bc6c7146b91af3f567cf6daeaec360bc07d45ffec4cf5353f4d7a208ce7ca30a"
  end

  resource "pytz" do
    url "https://files.pythonhosted.org/packages/ca/a9/62f96decb1e309d6300ebe7eee9acfd7bccaeedd693794437005b9067b44/pytz-2018.5.tar.gz"
    sha256 "ffb9ef1de172603304d9d2819af6f5ece76f2e85ec10692a524dd876e72bf277"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/97/10/92d25b93e9c266c94b76a5548f020f3f1dd0eb40649cb1993532c0af8f4c/requests-2.20.0.tar.gz"
    sha256 "99dcfdaaeb17caf6e526f32b6a7b780461512ab3f1d992187801694cba42770c"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz"
    sha256 "70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9"
  end

  resource "snowballstemmer" do
    url "https://files.pythonhosted.org/packages/20/6b/d2a7cb176d4d664d94a6debf52cd8dbae1f7203c8e42426daa077051d59c/snowballstemmer-1.2.1.tar.gz"
    sha256 "919f26a68b2c17a7634da993d91339e288964f93c274f1343e3bbbe2096e1128"
  end

  resource "Sphinx" do
    url "https://files.pythonhosted.org/packages/c7/e9/b1bed881847680cecc70159b8b9d5fd1cd4e85627c534712c2c7b339f8b6/Sphinx-1.8.1.tar.gz"
    sha256 "652eb8c566f18823a022bb4b6dbc868d366df332a11a0226b5bc3a798a479f17"
  end

  resource "sphinxcontrib-websupport" do
    url "https://files.pythonhosted.org/packages/07/7a/e74b06dce85555ffee33e1d6b7381314169ebf7e31b62c18fcb2815626b7/sphinxcontrib-websupport-1.1.0.tar.gz"
    sha256 "9de47f375baf1ea07cdb3436ff39d7a9c76042c10a769c52353ec46e4e8fc3b9"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/a5/74/05ffd00b4b5c08306939c485869f5dc40cbc27357195b0a98b18e4c48893/urllib3-1.24.tar.gz"
    sha256 "41c3db2fc01e5b907288010dec72f9d0a74e37d6994e6eb56849f59fea2265ae"
  end

  resource "appnope" do
    url "https://files.pythonhosted.org/packages/26/34/0f3a5efac31f27fabce64645f8c609de9d925fe2915304d1a40f544cff0e/appnope-0.1.0.tar.gz"
    sha256 "8b995ffe925347a2138d7ac0fe77155e4311a0ea6d6da4f5128fe4b3cbe5ed71"
  end

  resource "backcall" do
    url "https://files.pythonhosted.org/packages/84/71/c8ca4f5bb1e08401b916c68003acf0a0655df935d74d93bf3f3364b310e0/backcall-0.1.0.tar.gz"
    sha256 "38ecd85be2c1e78f77fd91700c76e14667dc21e2713b63876c0eb901196e01e4"
  end

  resource "bleach" do
    url "https://files.pythonhosted.org/packages/ae/31/680afc7d44040004296a2d8f0584983c2f2386448cd9d0964197e6c1160e/bleach-3.0.2.tar.gz"
    sha256 "48d39675b80a75f6d1c3bdbffec791cf0bbbab665cf01e20da701c77de278718"
  end

  resource "decorator" do
    url "https://files.pythonhosted.org/packages/6f/24/15a229626c775aae5806312f6bf1e2a73785be3402c0acdec5dbddd8c11e/decorator-4.3.0.tar.gz"
    sha256 "c39efa13fbdeb4506c476c9b3babf6a718da943dab7811c206005a4a956c080c"
  end

  resource "defusedxml" do
    url "https://files.pythonhosted.org/packages/74/ba/4ba4e89e21b5a2e267d80736ea674609a0a33cc4435a6d748ef04f1f9374/defusedxml-0.5.0.tar.gz"
    sha256 "24d7f2f94f7f3cb6061acb215685e5125fbcdc40a857eff9de22518820b0a4f4"
  end

  resource "entrypoints" do
    url "https://files.pythonhosted.org/packages/27/e8/607697e6ab8a961fc0b141a97ea4ce72cd9c9e264adeb0669f6d194aa626/entrypoints-0.2.3.tar.gz"
    sha256 "d2d587dde06f99545fb13a383d2cd336a8ff1f359c5839ce3a64c917d10c029f"
  end

  resource "ipykernel" do
    url "https://files.pythonhosted.org/packages/11/0b/95330660f8cc5d63428b9886c800ea8d68842fd866389cf579acca4915be/ipykernel-5.1.0.tar.gz"
    sha256 "0fc0bf97920d454102168ec2008620066878848fcfca06c22b669696212e292f"
  end

  resource "ipython" do
    url "https://files.pythonhosted.org/packages/5b/e3/4b3082bd7f6908af828561b0129b5064bff4a13e6acadb321fc2d939a605/ipython-7.0.1.tar.gz"
    sha256 "9fed506c3772c875a3048bc134a25e6f5e997b1569b2636f6a5d891f34cbfd46"
  end

  resource "ipython_genutils" do
    url "https://files.pythonhosted.org/packages/e8/69/fbeffffc05236398ebfcfb512b6d2511c622871dca1746361006da310399/ipython_genutils-0.2.0.tar.gz"
    sha256 "eb2e116e75ecef9d4d228fdc66af54269afa26ab4463042e33785b887c628ba8"
  end

  resource "ipywidgets" do
    url "https://files.pythonhosted.org/packages/88/8d/c5d3ac1bdcd74c7327c733c9d02354ff12d7d72744f262ed1e26560962b2/ipywidgets-7.4.2.tar.gz"
    sha256 "a3e224f430163f767047ab9a042fc55adbcab0c24bbe6cf9f306c4f89fdf0ba3"
  end

  resource "jedi" do
    url "https://files.pythonhosted.org/packages/c1/fd/cba30adcd2a739b1288b9dc87830c28797181492757080294523d03599e6/jedi-0.13.1.tar.gz"
    sha256 "b7493f73a2febe0dc33d51c99b474547f7f6c0b2c8fb2b21f453eef204c12148"
  end

  resource "jsonschema" do
    url "https://files.pythonhosted.org/packages/58/b9/171dbb07e18c6346090a37f03c7e74410a1a56123f847efed59af260a298/jsonschema-2.6.0.tar.gz"
    sha256 "6ff5f3180870836cae40f06fa10419f557208175f13ad7bc26caa77beb1f6e02"
  end

  resource "jupyter_client" do
    url "https://files.pythonhosted.org/packages/4c/df/1e8df7f4de63cc667a7a9aa234539c0419513bf94ac57d36d73b3b434786/jupyter_client-5.2.3.tar.gz"
    sha256 "27befcf0446b01e29853014d6a902dd101ad7d7f94e2252b1adca17c3466b761"
  end

  resource "jupyter_core" do
    url "https://files.pythonhosted.org/packages/b6/2d/2804f4de3a95583f65e5dcb4d7c8c7183124882323758996e867f47e72af/jupyter_core-4.4.0.tar.gz"
    sha256 "ba70754aa680300306c699790128f6fbd8c306ee5927976cbe48adacf240c0b7"
  end

  resource "MarkupSafe" do
    url "https://files.pythonhosted.org/packages/4d/de/32d741db316d8fdb7680822dd37001ef7a448255de9699ab4bfcbdf4172b/MarkupSafe-1.0.tar.gz"
    sha256 "a6be69091dac236ea9c6bc7d012beab42010fa914c459791d627dad4910eb665"
  end

  resource "mistune" do
    url "https://files.pythonhosted.org/packages/2d/a4/509f6e7783ddd35482feda27bc7f72e65b5e7dc910eca4ab2164daf9c577/mistune-0.8.4.tar.gz"
    sha256 "59a3429db53c50b5c6bcc8a07f8848cb00d7dc8bdb431a4ab41920d201d4756e"
  end

  resource "nbconvert" do
    url "https://files.pythonhosted.org/packages/88/68/0417164f344ad702245424d8f998b5c99f1c6147ad1ad645a465ae932134/nbconvert-5.4.0.tar.gz"
    sha256 "a8a2749f972592aa9250db975304af6b7337f32337e523a2c995cc9e12c07807"
  end

  resource "nbformat" do
    url "https://files.pythonhosted.org/packages/6e/0e/160754f7ae3e984863f585a3743b0ed1702043a81245907c8fae2d537155/nbformat-4.4.0.tar.gz"
    sha256 "f7494ef0df60766b7cabe0a3651556345a963b74dbc16bc7c18479041170d402"
  end

  resource "notebook" do
    url "https://files.pythonhosted.org/packages/cd/41/b04ddb3020bdb55431f2a06c87ff98bf68fb27cd0c165ae6421c17d3b5cb/notebook-5.7.0.tar.gz"
    sha256 "b85e4de3d54cf4f14fe1d0515a980ccb49ddd4cdd21250cc0d4fb6374d50b1a7"
  end

  resource "pandocfilters" do
    url "https://files.pythonhosted.org/packages/4c/ea/236e2584af67bb6df960832731a6e5325fd4441de001767da328c33368ce/pandocfilters-1.4.2.tar.gz"
    sha256 "b3dd70e169bb5449e6bc6ff96aea89c5eea8c5f6ab5e207fc2f521a2cf4a0da9"
  end

  resource "parso" do
    url "https://files.pythonhosted.org/packages/46/31/60de7c9cbb97cac56b193a5b61a1fd4d21df84843a570b370ec34781316b/parso-0.3.1.tar.gz"
    sha256 "35704a43a3c113cce4de228ddb39aab374b8004f4f2407d070b6a2ca784ce8a2"
  end

  resource "pexpect" do
    url "https://files.pythonhosted.org/packages/89/43/07d07654ee3e25235d8cea4164cdee0ec39d1fda8e9203156ebe403ffda4/pexpect-4.6.0.tar.gz"
    sha256 "2a8e88259839571d1251d278476f3eec5db26deb73a70be5ed5dc5435e418aba"
  end

  resource "pickleshare" do
    url "https://files.pythonhosted.org/packages/d8/b6/df3c1c9b616e9c0edbc4fbab6ddd09df9535849c64ba51fcb6531c32d4d8/pickleshare-0.7.5.tar.gz"
    sha256 "87683d47965c1da65cdacaf31c8441d12b8044cdec9aca500cd78fc2c683afca"
  end

  resource "prometheus_client" do
    url "https://files.pythonhosted.org/packages/61/84/9aa657b215b04f21a72ca8e50ff159eef9795096683e4581a357baf4dde6/prometheus_client-0.4.2.tar.gz"
    sha256 "046cb4fffe75e55ff0e6dfd18e2ea16e54d86cc330f369bebcc683475c8b68a9"
  end

  resource "prompt_toolkit" do
    url "https://files.pythonhosted.org/packages/96/29/179b81ea51e5abbd04888489d745ef4817c0c1b29b2a3f8efe7ea569b4a4/prompt_toolkit-2.0.6.tar.gz"
    sha256 "82766ffd7397e6661465e20bd1390db0781ca4fbbab4cf6c2578cacdd8b09754"
  end

  resource "ptyprocess" do
    url "https://files.pythonhosted.org/packages/7d/2d/e4b8733cf79b7309d84c9081a4ab558c89d8c89da5961bf4ddb050ca1ce0/ptyprocess-0.6.0.tar.gz"
    sha256 "923f299cc5ad920c68f2bc0bc98b75b9f838b93b599941a6b63ddbc2476394c0"
  end

  resource "Pygments" do
    url "https://files.pythonhosted.org/packages/71/2a/2e4e77803a8bd6408a2903340ac498cb0a2181811af7c9ec92cb70b0308a/Pygments-2.2.0.tar.gz"
    sha256 "dbae1046def0efb574852fab9e90209b23f556367b5a320c0bcb871c77c3e8cc"
  end

  resource "pyzmq" do
    url "https://files.pythonhosted.org/packages/b9/6a/bc9277b78f5c3236e36b8c16f4d2701a7fd4fa2eb697159d3e0a3a991573/pyzmq-17.1.2.tar.gz"
    sha256 "a72b82ac1910f2cf61a49139f4974f994984475f771b0faa730839607eeedddf"
  end

  resource "Send2Trash" do
    url "https://files.pythonhosted.org/packages/13/2e/ea40de0304bb1dc4eb309de90aeec39871b9b7c4bd30f1a3cdcb3496f5c0/Send2Trash-1.5.0.tar.gz"
    sha256 "60001cc07d707fe247c94f74ca6ac0d3255aabcb930529690897ca2a39db28b2"
  end

  resource "simplegeneric" do
    url "https://files.pythonhosted.org/packages/3d/57/4d9c9e3ae9a255cd4e1106bb57e24056d3d0709fc01b2e3e345898e49d5b/simplegeneric-0.8.1.zip"
    sha256 "dc972e06094b9af5b855b3df4a646395e43d1c9d0d39ed345b7393560d0b9173"
  end

  resource "terminado" do
    url "https://files.pythonhosted.org/packages/67/84/ce0ebd0f60e1cbe040f8e065eef7063855d59d9cf5e6438b3f8439fc7e15/terminado-0.8.1.tar.gz"
    sha256 "55abf9ade563b8f9be1f34e4233c7b7bde726059947a593322e8a553cc4c067a"
  end

  resource "testpath" do
    url "https://files.pythonhosted.org/packages/06/30/9a7e917066d851d8b4117e85794b5f14516419ea714a8a2681ec6aa8a981/testpath-0.4.2.tar.gz"
    sha256 "b694b3d9288dbd81685c5d2e7140b81365d46c29f5db4bc659de5aa6b98780f8"
  end

  resource "tornado" do
    url "https://files.pythonhosted.org/packages/e6/78/6e7b5af12c12bdf38ca9bfe863fcaf53dc10430a312d0324e76c1e5ca426/tornado-5.1.1.tar.gz"
    sha256 "4e5158d97583502a7e2739951553cbd88a72076f152b4b11b64b9a10c4c49409"
  end

  resource "traitlets" do
    url "https://files.pythonhosted.org/packages/a5/98/7f5ef2fe9e9e071813aaf9cb91d1a732e0a68b6c44a32b38cb8e14c3f069/traitlets-4.3.2.tar.gz"
    sha256 "9c4bd2d267b7153df9152698efb1050a5d84982d3384a37b2c1f7723ba3e7835"
  end

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/55/11/e4a2bb08bb450fdbd42cc709dd40de4ed2c472cf0ccb9e64af22279c5495/wcwidth-0.1.7.tar.gz"
    sha256 "3df37372226d6e63e1b1e1eda15c594bca98a22d33a23832a90998faa96bc65e"
  end

  resource "webencodings" do
    url "https://files.pythonhosted.org/packages/0b/02/ae6ceac1baeda530866a85075641cec12989bd8d31af6d5ab4a3e8c92f47/webencodings-0.5.1.tar.gz"
    sha256 "b36a1c245f2d304965eb4e0a82848379241dc04b865afcc4aab16748587e1923"
  end

  resource "widgetsnbextension" do
    url "https://files.pythonhosted.org/packages/cb/37/ec01aac3e510645959795337bf652155cd7efb28aecc940b0773e8ba8e4d/widgetsnbextension-3.4.2.tar.gz"
    sha256 "fa618be8435447a017fd1bf2c7ae922d0428056cfc7449f7a8641edf76b48265"
  end

  resource "PyCifRW" do
    url "https://files.pythonhosted.org/packages/4c/ab/b4842d450c06104c3f037c391a1ac5165e677b1226b44bc47a0b9cbc1bd3/PyCifRW-4.4.tar.gz"
    sha256 "f365ed97991738a99722e08afe772fe197bf7f40dfc0a210d524e7742ad81ff8"
  end

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/9e/a3/1d13970c3f36777c583f136c136f804d70f500168edc1edea6daa7200769/PyYAML-3.13.tar.gz"
    sha256 "3ef3092145e9b70e3ddd2c7ad59bdd0252a94dfe3949721633e41344de00a6bf"
  end

  resource "mock" do
    url "https://files.pythonhosted.org/packages/0c/53/014354fc93c591ccc4abff12c473ad565a2eb24dcd82490fae33dbf2539f/mock-2.0.0.tar.gz"
    sha256 "b158b6df76edd239b8208d481dc46b6afd45a846b7812ff0ce58971cf5bc8bba"
  end

  resource "pbr" do
    url "https://files.pythonhosted.org/packages/5b/d2/a07a37e26dbd305e0efc3191a5e6e2378e43403d5cfaf7dae39b92db3612/pbr-5.0.0.tar.gz"
    sha256 "ab94783019179bf48f5784edc63f5bc8328ec5ff93f33591567f266d21ac7323"
  end

  resource "psutil" do
    url "https://files.pythonhosted.org/packages/7d/9a/1e93d41708f8ed2b564395edfa3389f0fd6d567597401c2e5e2775118d8b/psutil-5.4.7.tar.gz"
    sha256 "5b6322b167a5ba0c5463b4d30dfd379cd4ce245a1162ebf8fc7ab5c5ffae4f3b"
  end

  resource "QtAwesome" do
    url "https://files.pythonhosted.org/packages/42/86/1fcce4481660fce2e05c0b70d735c60c8439a0c48a66b3339941c5685a97/QtAwesome-0.5.1.tar.gz"
    sha256 "41add5ad15659f461451afe0fb2d9eaef0294eb1067ab517b86a973e1df7c696"
  end

  resource "QtPy" do
    url "https://files.pythonhosted.org/packages/ca/96/18e3d1163a3ec2b9f968d7afd896914212e0708230df44d5a6c342f16d13/QtPy-1.5.2.tar.gz"
    sha256 "4c690f90586c82c1210bb6fdf5e9ee4d1228809421dc6a349c5afacc27caabcd"
  end

  resource "Cycler" do
    url "https://files.pythonhosted.org/packages/c2/4b/137dea450d6e1e3d474e1d873cd1d4f7d3beed7e0dc973b06e8e10d32488/cycler-0.10.0.tar.gz"
    sha256 "cd7b2d1018258d7247a71425e9f26463dfb444d411c39569972f4ce586b0c9d8"
  end

  resource "kiwisolver" do
    url "https://files.pythonhosted.org/packages/31/60/494fcce70d60a598c32ee00e71542e52e27c978e5f8219fae0d4ac6e2864/kiwisolver-1.0.1.tar.gz"
    sha256 "ce3be5d520b4d2c3e5eeb4cd2ef62b9b9ab8ac6b6fedbaa0e39cdb6f50644278"
  end

  resource "matplotlib" do
    url "https://files.pythonhosted.org/packages/ec/06/def4fb2620cbe671ba0cb6462cbd8653fbffa4acd87d6d572659e7c71c13/matplotlib-3.0.0.tar.gz"
    sha256 "b4e2333c98a7c2c1ff6eb930cd2b57d4b818de5437c5048802096b32f66e65f9"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/a0/b0/a4e3241d2dee665fea11baec21389aec6886655cd4db7647ddf96c3fad15/python-dateutil-2.7.3.tar.gz"
    sha256 "e27001de32f627c22380a688bcc43ce83504a7bc5da472209b4c70f02829f0b8"
  end

  resource "sphinx-bootstrap-theme" do
    url "https://files.pythonhosted.org/packages/8a/f6/e7dbc28e448817d2b103c57a3e4ee52f8edc143beab9595ced31e4789749/sphinx-bootstrap-theme-0.6.5.tar.gz"
    sha256 "82936109a05b84029052e7efb1756161c3b4c27ae18512a90234d50fe608cba7"
  end

  def install
    # Create a virtualenv in `libexec`. If your app needs Python 3, make sure that
    # `depends_on "python"` is declared, and use `virtualenv_create(libexec, "python")`.
    venv = virtualenv_create(libexec,"python3")
    # Install all of the resources declared on the formula into the virtualenv.
    venv.pip_install resources
    # `pip_install_and_link` takes a look at the virtualenv's bin directory
    # before and after installing its argument. New scripts will be symlinked
    # into `bin`. `pip_install_and_link buildpath` will install the package
    # that the formula points to, because buildpath is the location where the
    # formula's tarball was unpacked.
    # venv.pip_install_and_link buildpath
    bundle_path = libexec/"lib/python3.6/site-packages"
    (lib/"python3.6/site-packages/homebrew-mantid-developer-bundle.pth").write "#{bundle_path}\n"
    prefix.install("pyport.patch")
  end
end
