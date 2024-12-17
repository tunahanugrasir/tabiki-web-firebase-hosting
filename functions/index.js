const functions = require('firebase-functions');
const nodemailer = require('nodemailer');

// Gmail için transporter oluştur
const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: 'your-gmail@gmail.com', // Gmail hesabınız
    pass: 'your-app-specific-password' // Gmail uygulama şifreniz
  }
});

exports.sendContactForm = functions.https.onCall(async (data, context) => {
  try {
    const mailOptions = {
      from: 'your-gmail@gmail.com',
      to: 'destek@tabiki.co',
      subject: `İletişim Formu - ${data.name}`,
      text: `
Ad Soyad: ${data.name}
E-posta: ${data.email}
Telefon: ${data.phone}

Mesaj:
${data.message}
      `,
    };

    await transporter.sendMail(mailOptions);
    return { success: true };
  } catch (error) {
    console.error('Error sending email:', error);
    throw new functions.https.HttpsError('internal', 'Mail gönderilemedi');
  }
}); 