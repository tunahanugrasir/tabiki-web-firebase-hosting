import '../models/legal_notice_model.dart';
import '../models/legal_section_model.dart';

class LegalNoticesData {
  static final Map<String, LegalSectionModel> sections = {
    'Müşteri Kişisel Verileri Aydınlatma Metni': LegalSectionModel(
      sectionTitle: 'TABİKİ GRUP TEKNOLOJİ TİCARET LİMİTED ŞİRKETİ - MÜŞTERİ KİŞİSEL VERİLERİ AYDINLATMA METNİ',
      notices: [
        LegalNoticeModel(
          title: '1. Veri Sorumlusunun Kimliği',
          content: [
            'TABİKİ GRUP TEKNOLOJİ TİCARET LİMİTED ŞİRKETİ ("Şirket") olarak, müşterilerimizin kişisel verilerinin korunmasına büyük önem vermekte ve 6698 sayılı Kişisel Verilerin Korunması Kanunu ("KVKK"), ikincil düzenlemeler ve Kişisel Verileri Koruma Kurulu kararlarına uygun olarak hareket etmekteyiz. Bu Aydınlatma Metni, www.tabiki.co adresi ("Web Sitesi") ve mobil uygulama aracılığıyla işlediğimiz kişisel verilerinize dair bilgilendirme yapmak amacıyla hazırlanmıştır.',
            '',
            'Şirket Bilgileri:',
            '• Şirket Unvanı: TABİKİ GRUP TEKNOLOJİ TİCARET LİMİTED ŞİRKETİ',
            '• Ticaret Sicil Numarası: 15732',
            '• Vergi Numarası: 8151171333',
            '• Adres: KARAÇULHA MAH. CUMHURİYET (CUMHURİYET) (KRC) BLV. NO: 1 /1 FETHİYE/ MUĞLA',
            '• Telefon: +90 530 697 89 70',
            '• E-posta: destek@tabiki.co',
          ],
        ),
        LegalNoticeModel(
          title: '2. Hangi Kişisel Verilerinizi İşliyoruz?',
          content: [
            'Hizmetlerimizi sunarken aşağıda belirtilen kişisel veriler işlenmektedir:',
            '',
            'Kimlik Bilgileri: Ad, soyad, T.C. kimlik numarası',
            'İletişim Bilgileri: Telefon numarası, e-posta adresi, açık adres',
            'Hesap Bilgileri: Müşteri numarası, kullanıcı adı, profil fotoğrafı',
            'Ödeme Bilgileri: Kredi/banka kartı bilgileri, ödeme geçmişi',
            'Müşteri İşlem Bilgileri: Sipariş geçmişi, fatura bilgileri, kullanım alışkanlıkları, yorumlar, talepler',
            'Lokasyon Bilgileri: Hizmetlerin sunulması için konum verisi (tarayıcı izinleri veya manuel giriş)',
            'İşlem Güvenliği Bilgileri: IP adresi, cihaz bilgileri (cihaz modeli, işletim sistemi ve sürümü)',
            'Görsel ve İşitsel Veriler: Çağrı merkezi ses kayıtları, kullanıcı tarafından sağlanan görseller',
            'Hukuki İşlem Bilgileri: İdari ve adli makamlardan gelen talepler',
          ],
        ),
        LegalNoticeModel(
          title: '3. Kişisel Verilerin İşlenme Amaçları',
          content: [
            'Kişisel verileriniz, aşağıdaki amaçlarla işlenmektedir:',
            '• Hizmetlerin sunulması, siparişlerin alınması ve teslim edilmesi,',
            '• Ödeme işlemlerinin gerçekleştirilmesi,',
            '• Kullanıcı hesaplarının oluşturulması ve yönetilmesi,',
            '• Müşteri taleplerinin ve şikayetlerinin değerlendirilmesi,',
            '• Hukuki yükümlülüklerin yerine getirilmesi,',
            '• İş faaliyetlerinin mevzuata uygun yürütülmesi,',
            '• Kampanya ve özel tekliflerin tanıtımı,',
            '• Kullanıcı deneyiminin geliştirilmesi ve kişiselleştirilmiş içerik sunulması.',
          ],
        ),
        LegalNoticeModel(
          title: '4. Kişisel Verilerin Toplanma Yöntemleri',
          content: [
            'Kişisel verileriniz, aşağıdaki yöntemlerle toplanmaktadır:',
            '• Web sitesi ve mobil uygulama kayıt formları,',
            '• Telefon, e-posta ve çağrı merkezi iletişimleri,',
            '• Çerezler ve diğer analiz teknolojileri,',
            '• Fiziki belgeler ve form doldurma süreçleri.',
          ],
        ),
        LegalNoticeModel(
          title: '5. Kişisel Verilerin İşlenmesinin Hukuki Sebepleri',
          content: [
            'Kişisel verileriniz, KVKK\'nın 5. ve 6. maddelerinde belirtilen şu hukuki sebeplere dayanılarak işlenmektedir:',
            '• Sözleşmenin kurulması ve ifası için gerekli olması,',
            '• Hukuki yükümlülüklerin yerine getirilmesi,',
            '• Meşru menfaatlerimizin korunması,',
            '• Açık rızanızın bulunması.',
          ],
        ),
        LegalNoticeModel(
          title: '6. Kişisel Verilerin Üçüncü Kişilere Aktarılması',
          content: [
            'Kişisel verileriniz, KVKK\'nın 8. ve 9. maddelerine uygun olarak üçüncü taraflarla paylaşılabilir. Verilerinizin aktarılabileceği taraflar şunlardır:',
            '• Lojistik ve Kurye Hizmetleri: Sipariş teslimat süreçlerinin yönetimi.',
            '• Ödeme Sistemleri: Finansal işlemlerin gerçekleştirilmesi.',
            '• Yetkili Kurum ve Kuruluşlar: Hukuki yükümlülüklerin yerine getirilmesi amacıyla.',
            '• İş Ortakları ve Tedarikçiler: Teknik destek, altyapı hizmetleri ve veri analiz süreçleri.',
          ],
        ),
        LegalNoticeModel(
          title: '7. Kişisel Verilerin Saklanma Süresi',
          content: [
            'Kişisel verileriniz, işleme amacı için gerekli süre boyunca ve yasal düzenlemelerde öngörülen zamanaşımı süreleri boyunca saklanacaktır. Saklama süresi dolduğunda, verileriniz güvenli bir şekilde silinir veya anonim hale getirilir.',
          ],
        ),
        LegalNoticeModel(
          title: '8. Kişisel Verilerinizle İlgili Haklarınız',
          content: [
            'KVKK\'nın 11. maddesi uyarınca aşağıdaki haklara sahipsiniz:',
            '• Kişisel verilerinizin işlenip işlenmediğini öğrenme,',
            '• İşlenme amacını ve amacına uygun kullanılıp kullanılmadığını öğrenme,',
            '• Verilerinizin yurt içi veya yurt dışında aktarıldığı üçüncü kişileri bilme,',
            '• Yanlış veya eksik işlenen verilerinizin düzeltilmesini isteme,',
            '• Kişisel verilerinizin silinmesini veya yok edilmesini talep etme,',
            '• İşlemlerinizin kanuna aykırı olarak işlenmesi durumunda zararın giderilmesini talep etme.',
          ],
        ),
        LegalNoticeModel(
          title: '9. Kişisel Verilerinizle İlgili Başvuru Yöntemi',
          content: [
            'Haklarınızı kullanmak için aşağıdaki yöntemlerle bize başvurabilirsiniz:',
            '• E-posta: destek@tabiki.co',
            '• Posta: KARAÇULHA MAH. CUMHURİYET (CUMHURİYET) (KRC) BLV. NO: 1 /1 FETHİYE/ MUĞLA',
            '',
            'Başvurularınız, talebin niteliğine göre en geç 30 gün içinde ücretsiz olarak sonuçlandırılacaktır.',
          ],
        ),
        LegalNoticeModel(
          title: '10. Politika Güncellemeleri',
          content: [
            'Bu Aydınlatma Metni, yasal düzenlemelere uyum sağlamak amacıyla güncellenebilir. En güncel hali www.tabiki.co adresinde yayınlanacaktır.',
            '',
            'Son Güncelleme Tarihi: 19/12/2024',
          ],
        ),
      ],
    ),
    'Şirket Bilgileri': LegalSectionModel(
      sectionTitle: 'Yasal Bildirimler',
      notices: [
        LegalNoticeModel(
          title: '1. Şirket Bilgileri',
          content: [
            'Bu web sitesi, aşağıdaki şirket tarafından işletilmektedir:',
            '• Şirket Unvanı: TABİKİ GRUP TEKNOLOJİ TİCARET LİMİTED ŞİRKETİ',
            '• Ticaret Sicil Numarası: 15732',
            '• Vergi Numarası: 8151171333',
            '• Adres: KARAÇULHA MAH. CUMHURİYET (CUMHURİYET) (KRC) BLV. NO: 1 /1 FETHİYE/ MUĞLA',
            '• Telefon: +90 530 697 89 70',
            '• E-posta: destek@tabiki.co',
            '• Web Sitesi Alan Adı: tabiki.co',
          ],
        ),
        LegalNoticeModel(
          title: '2. Hizmet Şartları ve Koşulları',
          content: [
            'Web sitemizi ziyaret ederek veya kullanarak aşağıdaki hüküm ve koşulları kabul etmiş sayılırsınız:',
            '• Sağlanan bilgiler, ürünler ve hizmetler yalnızca bilgi ve ticari amaçlarla sunulmaktadır.',
            '• Kullanıcılar, bu sitedeki herhangi bir içeriği izinsiz kopyalamaktan veya çoğaltmaktan kaçınmalıdır.',
            '• Web sitesinde sunulan ürün ve hizmetlerin fiyatları ve detayları önceden haber verilmeksizin değiştirilebilir.',
          ],
        ),
        LegalNoticeModel(
          title: '3. Fikri Mülkiyet Hakları',
          content: [
            'Bu web sitesinde yer alan tüm içerik, grafikler, logolar, resimler, metinler, yazılımlar ve diğer materyaller TABİKİ GRUP TEKNOLOJİ TİCARET LİMİTED ŞİRKETİ’ne veya lisans verenlerine aittir ve ulusal ve uluslararası fikri mülkiyet yasalarıyla korunmaktadır.',
            '• Kullanıcılar, sitedeki materyalleri yalnızca kişisel ve ticari olmayan amaçlarla kullanabilir.',
            '• İzinsiz kullanım durumunda yasal işlem başlatma hakkımız saklıdır.',
          ],
        ),
        LegalNoticeModel(
          title: '4. Veri Koruma ve Gizlilik',
          content: [
            'Şirketimiz, müşterilerimizin gizliliğini korumayı taahhüt eder.',
            '• Toplanan kişisel veriler yalnızca hizmet sunumu amacıyla kullanılacaktır.',
            '• Kişisel veriler, 6698 Sayılı Kişisel Verilerin Korunması Kanunu (KVKK) ve ilgili diğer mevzuat uyarınca işlenecektir.',
            '• Daha fazla bilgi için Gizlilik Politikası bağlantısını ziyaret edebilirsiniz.',
          ],
        ),
        LegalNoticeModel(
          title: '5. Sorumluluk Sınırlamaları',
          content: [
            'TABİKİ GRUP TEKNOLOJİ TİCARET LİMİTED ŞİRKETİ, bu web sitesindeki bilgilerin doğruluğunu sağlamak için her türlü çabayı göstermektedir. Ancak:',
            '• İçeriğin hatalı veya eksik olmasından dolayı ortaya çıkabilecek herhangi bir zarardan sorumlu tutulamaz.',
            '• Web sitesi aracılığıyla sunulan üçüncü taraf bağlantılarının içeriğinden veya hizmetlerinden sorumluluk kabul edilmez.',
          ],
        ),
        LegalNoticeModel(
          title: '6. Çerez Politikası',
          content: [
            'Bu web sitesi, kullanıcı deneyimini iyileştirmek için çerezler kullanmaktadır.',
            '• Çerezler hakkında daha fazla bilgi için Çerez Politikası bağlantısını inceleyebilirsiniz.',
          ],
        ),
        LegalNoticeModel(
          title: '7. Yasal Uyuşmazlıklar',
          content: [
            'Bu web sitesinin kullanımıyla ilgili tüm uyuşmazlıklar, Türkiye Cumhuriyeti yasalarına tabidir ve Fethiye Mahkemeleri ve İcra Daireleri yetkili kılınmıştır.',
          ],
        ),
        LegalNoticeModel(
          title: '8. İletişim',
          content: [
            'Herhangi bir soru, talep veya şikayet için bizimle iletişime geçebilirsiniz:',
            '• E-posta: destek@tabiki.co',
            '• Telefon: +90 530 697 89 70',
            '• Adres: KARAÇULHA MAH. CUMHURİYET (CUMHURİYET) (KRC) BLV. NO: 1 /1 FETHİYE/ MUĞLA',
          ],
        ),
        LegalNoticeModel(
          title: '9. Güncelleme Hakkı',
          content: [
            'TABİKİ GRUP TEKNOLOJİ TİCARET LİMİTED ŞİRKETİ, bu yasal bildirimleri önceden haber vermeksizin güncelleme hakkını saklı tutar.',
          ],
        ),
      ],
    ),
    'Müşteri Kişisel Verilerinin Korunması Politikası': LegalSectionModel(
      sectionTitle: 'KVKK Aydınlatma Metni',
      notices: [
        LegalNoticeModel(
          title: '1. Veri Sorumlusunun Kimliği',
          content: [
            'TABİKİ GRUP TEKNOLOJİ TİCARET LİMİTED ŞİRKETİ (“Şirket”), 6698 Sayılı Kişisel Verilerin Korunması Kanunu (“Kanun”) kapsamında veri sorumlusu sıfatıyla hareket etmektedir.',
            'Bu kapsamda, kullanıcılarımızın kişisel verilerinin korunmasına ve gizliliğine büyük önem veriyoruz.',
          ],
        ),
        LegalNoticeModel(
          title: '2. İşlenen Kişisel Verileriniz',
          content: [
            'Web sitemiz ve mobil uygulamamız aracılığıyla aşağıdaki kişisel veriler toplanmaktadır:',
            '• Kimlik Bilgileri: Ad, soyad, T.C. kimlik numarası',
            '• İletişim Bilgileri: Telefon numarası, e-posta adresi, adres',
            '• Finansal Bilgiler: Kredi kartı/banka kartı bilgileri (ödeme işlemleri için)',
            '• Hizmet Kullanım Bilgileri: IP adresi, çerez kayıtları, işlem geçmişi',
            '• Görüş ve Geri Bildirimler: Şikayetler, öneriler ve yorumlar',
          ],
        ),
        LegalNoticeModel(
          title: '3. Kişisel Verilerin İşlenme Amaçları',
          content: [
            'Toplanan kişisel veriler, aşağıdaki amaçlarla işlenmektedir:',
            '• Üyelik işlemlerinin gerçekleştirilmesi,',
            '• Ürün ve hizmetlerin temini ve teslimi,',
            '• Ödemelerin işlenmesi ve finansal süreçlerin yürütülmesi,',
            '• Kullanıcı taleplerinin ve şikayetlerinin yönetimi,',
            '• Hizmetlerimizin tanıtımı, reklam ve kampanya süreçlerinin yürütülmesi,',
            '• Kullanıcı tercih ve alışkanlıklarına uygun özelleştirilmiş hizmet sunulması,',
            '• Bilgi güvenliği süreçlerinin yürütülmesi,',
            '• Yasal yükümlülüklerin yerine getirilmesi.',
          ],
        ),
        LegalNoticeModel(
          title: '4. Kişisel Verilerin Toplanma Yöntemleri ve Hukuki Sebepler',
          content: [
            'Kişisel verileriniz; web sitesi, mobil uygulama, çağrı merkezi, e-posta ve fiziki mağazalar gibi kanallar aracılığıyla sözlü, yazılı veya elektronik ortamda toplanmaktadır.',
            'Kişisel verileriniz, Kanun’un 5. ve 6. maddelerinde belirtilen aşağıdaki hukuki sebeplerle işlenmektedir:',
            '• Açık rızanızın bulunması,',
            '• Bir sözleşmenin kurulması veya ifası için gerekli olması,',
            '• Şirketin hukuki yükümlülüklerini yerine getirebilmesi.',
          ],
        ),
        LegalNoticeModel(
          title: '5. Kişisel Verilerin Aktarılması',
          content: [
            'Kişisel verileriniz aşağıdaki durumlarda üçüncü taraflarla paylaşılabilir:',
            '• İş Ortakları ve Tedarikçiler: Lojistik, ödeme altyapısı ve teknik destek hizmetleri sağlayıcıları ile.',
            '• Yetkili Kamu Kurumları: Yasal zorunluluklar çerçevesinde.',
            'Kişisel verileriniz, belirtilen amaçlar dışında üçüncü taraflarla paylaşılmayacaktır.',
          ],
        ),
        LegalNoticeModel(
          title: '6. Çerezler ve Tanımlama Teknolojileri',
          content: [
            'Web sitemiz ve mobil uygulamamızda kullanıcı deneyimini iyileştirmek ve performansı artırmak amacıyla çerezler kullanılmaktadır.',
            '• Çerez Türleri: İşlevsel çerezler, analitik çerezler ve zorunlu çerezler.',
            '• Çerez Tercihleri: Kullanıcılar, tarayıcı ayarlarından çerez kullanımını yönetebilir. Daha fazla bilgi için Çerez Politikası sayfamızı ziyaret edebilirsiniz.',
          ],
        ),
        LegalNoticeModel(
          title: '7. Bilgi Güvenliği',
          content: [
            'Şirketimiz, kişisel verilerinizin güvenliğini sağlamak için gerekli teknik ve idari tedbirleri almaktadır. Verileriniz, yetkisiz erişim, kayıp, çalınma veya kötüye kullanım risklerine karşı korunmaktadır.',
            '• Ödeme Bilgileri: Ödeme altyapısı [Ödeme Sağlayıcı] tarafından sağlanmaktadır. Kredi kartı bilgileriniz, yalnızca ödeme işlemleri için şifrelenmiş bir şekilde saklanır.',
          ],
        ),
        LegalNoticeModel(
          title: '8. Kullanıcıların Sorumlulukları',
          content: [
            '• Kullanıcı, hesap bilgilerini (kullanıcı adı, şifre vb.) güvenli bir şekilde saklamakla yükümlüdür.',
            '• Kullanıcı, bir başkası adına bilgi sağlıyorsa, bu konuda yetkilendirilmiş olduğunu taahhüt eder.',
          ],
        ),
        LegalNoticeModel(
          title: '9. Kişisel Verilerin Saklanma Süresi',
          content: [
            'Kişisel verileriniz, işleme amacı için gerekli olan süre boyunca veya ilgili mevzuatın öngördüğü süreler boyunca saklanır. Süre dolduğunda, verileriniz silinir, yok edilir veya anonim hale getirilir.',
          ],
        ),
        LegalNoticeModel(
          title: '10. Kullanıcı Hakları',
          content: [
            '6698 Sayılı Kanun’un 11. maddesi gereğince, kullanıcılarımız aşağıdaki haklara sahiptir:',
            '• Kişisel verilerinin işlenip işlenmediğini öğrenme,',
            '• İşlenme amacını öğrenme ve amaca uygun kullanılıp kullanılmadığını öğrenme,',
            '• Yanlış veya eksik verilerin düzeltilmesini isteme,',
            '• Kişisel verilerin silinmesini veya yok edilmesini talep etme,',
            '• Bu işlemlerin üçüncü kişilere bildirilmesini talep etme,',
            '• Otomatik sistemler aracılığıyla işlenen veriler nedeniyle oluşan sonuçlara itiraz etme,',
            '• Kanuna aykırı işleme nedeniyle zararın giderilmesini talep etme.',
            'Haklarınızı kullanmak için aşağıdaki iletişim kanallarından bizimle iletişime geçebilirsiniz:',
            '• Adres: KARAÇULHA MAH. CUMHURİYET (CUMHURİYET) (KRC) BLV. NO: 1 /1 FETHİYE/ MUĞLA',
            '• E-posta: destek@tabiki.co',
            '• Telefon: +90 530 697 89 70',
            '• Başvuru Formu: [Başvuru formu linki]',
          ],
        ),
        LegalNoticeModel(
          title: '11. Üçüncü Taraf Yönlendirmeleri',
          content: [
            'Web sitemiz ve mobil uygulamamız, üçüncü taraf hizmetlere veya sitelere yönlendirme yapabilir. Bu bağlantılardan herhangi birini ziyaret ettiğinizde, üçüncü tarafların gizlilik politikası geçerli olacaktır.',
          ],
        ),
        LegalNoticeModel(
          title: '12. Politika Güncellemeleri',
          content: [
            'Şirketimiz, bu KVKK Aydınlatma Metni’nde değişiklik yapma hakkını saklı tutar. Güncellemeler web sitemizde yayınlandığında yürürlüğe girer. Kullanıcılar, güncellemeleri takip etmekle yükümlüdür.',
          ],
        ),
        LegalNoticeModel(
          title: '13. Elektronik Ortamda Yaşanabilecek Teknik Sorunlar',
          content: [
            'Elektronik ortamda hizmet sunumu sırasında oluşabilecek kesinti, hata veya sistem arızası gibi durumlardan doğabilecek zararlar konusunda firmamız sorumlu tutulamaz.',
          ],
        ),
      ],
    ),
    'Çerez Politikası': LegalSectionModel(
      sectionTitle: 'Çerez Politikası',
      notices: [
        LegalNoticeModel(
          title: '1. Çerezler Hakkında',
          content: [
            'TABİKİ GRUP TEKNOLOJİ TİCARET LİMİTED ŞİRKETİ (“Şirket”) olarak, web sitemizde ve mobil uygulamamızda kullanıcı deneyimini iyileştirmek, performansı artırmak ve hizmetlerimizi özelleştirmek amacıyla çerezler ve benzeri teknolojiler kullanılmaktadır.',
            'Çerezler, bir web sitesini ziyaret ettiğinizde tarayıcınız tarafından cihazınıza kaydedilen küçük metin dosyalarıdır.',
          ],
        ),
        LegalNoticeModel(
          title: '2. Çerez Türleri ve Amaçları',
          content: [
            'Web sitemizde ve mobil uygulamamızda kullanılan çerez türleri ve amaçları aşağıda açıklanmıştır:',
            '• Zorunlu Çerezler: Web sitesinin düzgün çalışması için gereklidir. Bu çerezler olmadan temel hizmetler sağlanamaz.',
            '• İşlevsel Çerezler: Kullanıcı tercihlerini hatırlayarak deneyimi kişiselleştirir.',
            '• Performans ve Analitik Çerezler: Web sitesinin performansını izler ve kullanıcıların siteyi nasıl kullandığını analiz eder.',
            '• Reklam ve Hedefleme Çerezleri: Kullanıcılara ilgi alanlarına uygun reklamlar sunar.',
          ],
        ),
        LegalNoticeModel(
          title: '3. Çerezlerin Yönetimi',
          content: [
            'Kullanıcılar, tarayıcı ayarları üzerinden çerezlerin kullanımını yönetebilir veya engelleyebilir. Ancak, çerezlerin devre dışı bırakılması durumunda web sitesinin bazı bölümleri düzgün çalışmayabilir.',
            'Tarayıcı ayarlarını değiştirerek çerezleri kontrol etmek için aşağıdaki bağlantıları inceleyebilirsiniz:',
            '• Google Chrome: https://support.google.com/chrome/answer/95647',
            '• Mozilla Firefox: https://support.mozilla.org/tr/kb/cerezleri-etkinlestirme-ve-devre-disi-birakma',
            '• Safari: https://support.apple.com/tr-tr/guide/safari/sfri11471/mac',
            '• Microsoft Edge: https://support.microsoft.com/tr-tr/microsoft-edge',
          ],
        ),
        LegalNoticeModel(
          title: '4. Üçüncü Taraf Çerezleri',
          content: [
            'Web sitemiz, üçüncü taraf hizmet sağlayıcılar tarafından yerleştirilen çerezler kullanabilir. Bu çerezler, ilgili üçüncü tarafların kendi gizlilik politikalarına tabidir.',
            'Reklam ve analiz sağlayıcılarımız, kullanıcı davranışlarını izleyerek size özelleştirilmiş içerik ve reklamlar sunabilir.',
          ],
        ),
        LegalNoticeModel(
          title: '5. Kişisel Verilerin İşlenmesi',
          content: [
            'Çerezler aracılığıyla elde edilen kişisel veriler, 6698 Sayılı Kişisel Verilerin Korunması Kanunu (“KVKK”) ve ilgili mevzuata uygun olarak işlenmektedir.',
            'Bu veriler, çerez türüne göre anonimleştirilmiş veya kimlik bilgilerinizle ilişkilendirilmiş olabilir.',
            'Daha fazla bilgi için KVKK Aydınlatma Metnimizi inceleyebilirsiniz.',
          ],
        ),
        LegalNoticeModel(
          title: '6. Çerez Politikası Güncellemeleri',
          content: [
            'Şirketimiz, çerez politikamızı güncelleme hakkını saklı tutar. Herhangi bir güncelleme yapıldığında, bu politika web sitemizde yayınlanacak ve kullanıcılarımız bilgilendirilecektir.',
          ],
        ),
      ],
    ),
    'Gizlilik Politikası': LegalSectionModel(
      sectionTitle: 'Gizlilik Politikası',
      notices: [
        LegalNoticeModel(
          title: '1. Giriş',
          content: [
            'TABİKİ GRUP TEKNOLOJİ TİCARET LİMİTED ŞİRKETİ (“Şirket”) olarak, hizmetlerimizden yararlanan kullanıcılarımızın (“Kullanıcı”) bilgilerinin korunmasına ve gizliliğine büyük önem veriyoruz.',
            'Bu Gizlilik Politikası (“Politika”), Şirketimizin topladığı bilgileri nasıl kullandığını, kullanıcıların sorumluluklarını ve Şirketimizin gizli bilgilerin korunmasına ilişkin kurallarını açıklamaktadır.',
          ],
        ),
        LegalNoticeModel(
          title: '2. Topladığımız Bilgiler',
          content: [
            'Şirket hizmetlerinden yararlanmanız durumunda aşağıdaki bilgiler toplanabilir:',
            '• Kimlik Bilgileri: Ad, soyad',
            '• İletişim Bilgileri: Telefon numarası, e-posta adresi, adres',
            '• Ödeme Bilgileri: Kredi kartı/banka kartı bilgileri',
            '• Müşteri İşlem Bilgileri: Sipariş geçmişi, talep ve şikayet bilgileri',
            '• Hizmet Kullanım Bilgileri: Kullanıcı tercihleri, beğenileri ve kullanım alışkanlıkları',
          ],
        ),
        LegalNoticeModel(
          title: '3. Bilgileri Kullanma Amaçlarımız',
          content: [
            'Şirketimiz, kullanıcıların bilgilerini aşağıdaki amaçlarla kullanır:',
            '• Kullanıcılara hizmet sunmak',
            '• Kullanıcıların talep ve şikayetlerini yanıtlamak',
            '• Ödemelere ilişkin muhasebe süreçlerini yürütmek',
            '• Hizmetlerimizin tanıtımını yapmak, reklam ve kampanya süreçlerini yönetmek',
            '• Kullanıcı geri bildirimlerine göre hizmetlerimizi geliştirmek',
            '• Hizmetlerimizi kullanıcıların ilgi alanlarına göre özelleştirmek',
            '• Bilgi güvenliği süreçlerini yürütmek ve sistemsel sorunları çözmek',
          ],
        ),
        LegalNoticeModel(
          title: '4. Bilgilerinizin Üçüncü Kişilere Aktarılması',
          content: [
            'Kişisel verileriniz aşağıdaki durumlarda üçüncü kişilere aktarılabilir:',
            '• İş Ortakları: Teknik destek sağlayıcıları ve lojistik hizmet sağlayıcılar',
            '• Yetkili Kamu Kurumları: Yasal yükümlülüklerin yerine getirilmesi amacıyla',
            'Bilgileriniz, belirtilen amaçlar dışında üçüncü kişilere aktarılmayacaktır.',
          ],
        ),
        LegalNoticeModel(
          title: '5. Bilgilerinizin Saklanması ve Korunması',
          content: [
            'Bilgileriniz, toplama amacının gerektirdiği süre boyunca saklanacaktır. Mevzuatta özel bir saklama süresi öngörülmüşse, bu süreye uygun hareket edilir.',
            'Şirketimiz, bilgilerinizi siber saldırı ve veri kaybı gibi tehditlere karşı korumak için gerekli teknik ve idari tedbirleri alır.',
            'Ödeme altyapımız güvenli ödeme sağlayıcıları tarafından desteklenmektedir ve ödeme bilgileriniz şifrelenmiş şekilde saklanır.',
          ],
        ),
        LegalNoticeModel(
          title: '6. Bilgilerinizin Doğruluğu ve Güncelliği',
          content: [
            'Kullanıcıların sağladığı bilgilerin doğruluğu ve güncelliği kullanıcıların sorumluluğundadır.',
            'Bilgilerinizde bir değişiklik olduğunda, bunları güncellemek kullanıcıların sorumluluğundadır.',
            'Başkasına ait bilgi sağlıyorsanız, bu konuda yetkilendirilmiş olduğunuzu kabul etmiş sayılırsınız.',
          ],
        ),
        LegalNoticeModel(
          title: '7. Üçüncü Taraflara Yapılan Yönlendirmeler',
          content: [
            'Web sitemiz ve mobil uygulamamız, üçüncü taraf sitelere veya hizmetlere yönlendirme bağlantıları içerebilir.',
            'Üçüncü taraf bağlantıları ziyaret ettiğinizde, ilgili üçüncü tarafın gizlilik politikası geçerli olacaktır.',
            'Şirketimiz, bu tür üçüncü tarafların politika ve uygulamalarından sorumlu değildir.',
          ],
        ),
        LegalNoticeModel(
          title: '8. Gizlilik Politikası Değişiklikleri',
          content: [
            'Şirketimiz, Gizlilik Politikası’nda değişiklik yapma hakkını saklı tutar. Güncellemeler web sitemizde yayınlandığı anda yürürlüğe girer.',
            'Kullanıcılarımızın, Politika’daki değişiklikleri düzenli olarak kontrol etmeleri önerilir.',
          ],
        ),
        LegalNoticeModel(
          title: '9. Sorumluluk',
          content: [
            'Hizmetlerin elektronik ortamda sunulması sırasında oluşabilecek kesinti, hata, gecikme veya sistem arızası sonucunda doğabilecek zararlardan Şirketimiz sorumlu tutulamaz.',
          ],
        ),
        LegalNoticeModel(
          title: '10. İletişim',
          content: [
            'Herhangi bir soru, talep veya şikayet için bizimle aşağıdaki iletişim kanallarından iletişime geçebilirsiniz:',
            '• Adres: KARAÇULHA MAH. CUMHURİYET (CUMHURİYET) (KRC) BLV. NO: 1 /1 FETHİYE/ MUĞLA',
            '• E-posta: destek@tabiki.co',
            '• Telefon: +90 530 697 89 70',
          ],
        ),
      ],
    ),
    'Kullanım Koşulları': LegalSectionModel(
      sectionTitle: 'Kullanım Koşulları',
      notices: [
        LegalNoticeModel(
          title: '1. Giriş',
          content: [
            'TABİKİ GRUP TEKNOLOJİ TİCARET LİMİTED ŞİRKETİ (“Şirket”) tarafından işletilen web sitesi ve mobil uygulamaya (“Platform”) hoş geldiniz.',
            'Bu Kullanım Koşulları, platformumuzu kullanan kullanıcılar (“Kullanıcı”) için geçerlidir.',
            'Platformu kullanarak bu koşulları kabul etmiş sayılırsınız. Kabul etmiyorsanız, platformu kullanmaktan kaçınmalısınız.',
          ],
        ),
        LegalNoticeModel(
          title: '2. Hizmet Tanımı',
          content: [
            'Platform, kullanıcıların yerel üreticilerden ürün satın almasını sağlayan bir e-ticaret hizmeti sunmaktadır.',
            'Platform üzerinden sunulan ürünler, ilgili üreticiler veya iş ortaklarımız tarafından sağlanmaktadır.',
            'Platformumuz, ürünlerin satışından ve teslimatından sorumlu olmakla birlikte, üreticilerin sağlayacağı bilgilerin doğruluğunu garanti etmez.',
          ],
        ),
        LegalNoticeModel(
          title: '3. Üyelik ve Hesap Yönetimi',
          content: [
            'Platforma erişmek ve hizmetlerden yararlanmak için kullanıcıların üyelik oluşturması gerekmektedir.',
            'Kayıt sırasında sağlanan bilgilerin doğru ve güncel olduğundan emin olunmalıdır. Yanıltıcı veya hatalı bilgilerden kullanıcı sorumludur.',
            'Kullanıcılar, hesap bilgilerini (kullanıcı adı, şifre vb.) güvenli bir şekilde saklamaktan sorumludur.',
            'Şirket, herhangi bir şüpheli veya kötüye kullanım durumunda kullanıcı hesaplarını askıya alma veya sonlandırma hakkını saklı tutar.',
          ],
        ),
        LegalNoticeModel(
          title: '4. Kullanıcı Yükümlülükleri',
          content: [
            'Kullanıcılar, platformu yalnızca yasal amaçlarla ve kullanım koşullarına uygun şekilde kullanmayı taahhüt eder.',
            'Platform üzerinde gerçekleştirilen her türlü işlem ve eylemden kullanıcı sorumludur.',
            'Kullanıcılar, aşağıdaki durumlarda platformu kullanmaktan kaçınmalıdır:',
            '• Yanıltıcı veya sahte bilgiler sağlamak',
            '• Platformun güvenliğini tehdit edecek eylemlerde bulunmak',
            '• Diğer kullanıcıların haklarını ihlal etmek',
          ],
        ),
        LegalNoticeModel(
          title: '5. Sipariş ve Ödeme Koşulları',
          content: [
            'Platform üzerinden verilen siparişler, ödeme tamamlandıktan sonra işleme alınır.',
            'Ödemeler, güvenli ödeme altyapıları üzerinden gerçekleştirilir.',
            'Kullanıcı, sipariş verirken doğru ve eksiksiz bilgi sağlamakla yükümlüdür.',
            'Teslimat sırasında sipariş edilen ürünlerde herhangi bir hasar veya eksiklik olması durumunda kullanıcı, durumu derhal Şirket’e bildirmelidir.',
          ],
        ),
        LegalNoticeModel(
          title: '6. İptal ve İade Koşulları',
          content: [
            'Sipariş iptali ve iade işlemleri, Şirket’in iptal ve iade politikalarına tabidir.',
            'İade edilecek ürünlerin, teslim alınan durumuyla uyumlu ve kullanılmamış olması gerekmektedir.',
            'İade veya iptale ilişkin daha fazla bilgi için İptal ve İade Politikası sayfasını ziyaret edebilirsiniz.',
          ],
        ),
        LegalNoticeModel(
          title: '7. Fikri Mülkiyet Hakları',
          content: [
            'Platformda yer alan tüm içerik, görseller, logolar, metinler, yazılımlar ve diğer materyaller, Şirket veya lisans verenlerine aittir.',
            'Bu içerikler, önceden yazılı izin alınmadan kopyalanamaz, çoğaltılamaz veya ticari amaçlarla kullanılamaz.',
            'Kullanıcıların fikri mülkiyet haklarını ihlal etmesi durumunda, yasal işlem başlatılabilir.',
          ],
        ),
        LegalNoticeModel(
          title: '8. Gizlilik ve Veri Koruma',
          content: [
            'Kullanıcıların kişisel bilgileri, 6698 Sayılı Kişisel Verilerin Korunması Kanunu (“KVKK”) uyarınca işlenmektedir.',
            'Daha fazla bilgi için Gizlilik Politikası ve KVKK Aydınlatma Metni sayfalarını ziyaret edebilirsiniz.',
          ],
        ),
        LegalNoticeModel(
          title: '9. Sorumluluk Reddi',
          content: [
            'Platform üzerinden sunulan ürün ve hizmetlerin doğruluğunu ve kalitesini sağlama sorumluluğu üreticilere aittir.',
            'Şirket, aşağıdaki durumlarda sorumluluk kabul etmez:',
            '• Üçüncü taraflar tarafından sağlanan içerikler veya hizmetler',
            '• Platformun kesintiye uğraması, hatalar veya teknik aksaklıklar',
          ],
        ),
        LegalNoticeModel(
          title: '10. Yasal Uyuşmazlıklar',
          content: [
            'Bu kullanım koşulları, Türkiye Cumhuriyeti yasalarına tabidir.',
            'Platformun kullanımıyla ilgili ortaya çıkabilecek tüm uyuşmazlıklar, Fethiye Mahkemeleri ve İcra Daireleri tarafından çözümlenecektir.',
          ],
        ),
        LegalNoticeModel(
          title: '11. Güncellemeler',
          content: [
            'Şirket, Kullanım Koşulları’nı önceden haber vermeksizin güncelleme hakkını saklı tutar.',
            'Güncel koşullar, platformda yayınlandığı tarihten itibaren geçerlidir.',
            'Kullanıcıların bu koşulları düzenli olarak kontrol etmeleri önerilir.',
          ],
        ),
        LegalNoticeModel(
          title: '12. İletişim',
          content: [
            'Herhangi bir soru, öneri veya şikayet için bizimle iletişime geçebilirsiniz:',
            '• Adres: KARAÇULHA MAH. CUMHURİYET (CUMHURİYET) (KRC) BLV. NO: 1 /1 FETHİYE/ MUĞLA',
            '• Telefon: +90 530 697 89 70',
            '• E-posta: destek@tabiki.co',
          ],
        ),
      ],
    ),
  };
}
