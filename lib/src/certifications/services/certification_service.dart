import 'package:app/src/certifications/models/certification_model.dart';

class CertificationService {
  static List<CertificationModel> getSampleCertifications() {
    return [
      CertificationModel(
        id: '1',
        title: 'AWS Certified Solutions Architect',
        issuer: 'Amazon Web Services',
        description:
            'This certification validates expertise in designing and deploying scalable, highly available, and fault-tolerant systems on AWS. Covers architectural design principles and best practices.',
        imageUrl:
            'https://d1.awsstatic.com/training-and-certification/Certification%20Badges/AWS-Certified_Solutions-Architect_Associate_512x512.6d82c747016b8034b92fb8ce1fb6419e6bcafbfc.png',
        completedDate: DateTime(2024, 3, 15),
        expiryDate: DateTime(2027, 3, 15),
        skills: ['Cloud Architecture', 'AWS Services', 'Security', 'Cost Optimization'],
      ),
      CertificationModel(
        id: '2',
        title: 'Google Cloud Professional Cloud Architect',
        issuer: 'Google Cloud',
        description:
            'Professional Cloud Architects enable organizations to leverage Google Cloud technologies. They design, develop, and manage robust, secure, scalable, highly available, and dynamic solutions.',
        imageUrl:
            'https://avatars.githubusercontent.com/u/171433280?s=400&u=68fc1660b0c0fad32d59c2eb10fee1373474e743&v=4',
        skills: ['GCP Services', 'Solution Design', 'Migration Strategies', 'Kubernetes'],
      ),
      CertificationModel(
        id: '3',
        title: 'Microsoft Azure Fundamentals',
        issuer: 'Microsoft',
        description:
            'Azure Fundamentals is an opportunity to prove knowledge of cloud concepts, Azure services, Azure workloads, security and privacy in Azure, as well as Azure pricing and support.',
        imageUrl: 'https://images.credly.com/images/be8fcaeb-c769-4858-b567-ffaaa73ce8cf/image.png',
        completedDate: DateTime(2024, 1, 20),
        skills: ['Cloud Concepts', 'Azure Services', 'Security', 'Compliance'],
      ),
      CertificationModel(
        id: '4',
        title: 'Certified Kubernetes Administrator',
        issuer: 'CNCF',
        description:
            'The Certified Kubernetes Administrator (CKA) program provides assurance that CKAs have the skills, knowledge, and competency to perform the responsibilities of Kubernetes administrators.',
        imageUrl:
            'https://images.credly.com/images/8b8ed108-e77d-4396-ac59-2504583b9d54/cka_from_cncfsite__281_29.png',
        skills: ['Kubernetes', 'Container Orchestration', 'Cluster Management', 'Troubleshooting'],
      ),
      CertificationModel(
        id: '5',
        title: 'Flutter Development Certification',
        issuer: 'Google Developers',
        description:
            'Demonstrates proficiency in building cross-platform mobile applications using Flutter framework and Dart programming language.',
        imageUrl: 'https://storage.googleapis.com/cms-storage-bucket/847ae81f5430402216fd.svg',
        skills: ['Flutter', 'Dart', 'Mobile Development', 'UI/UX Design'],
      ),
    ];
  }

  static List<CertificationModel> getCompletedCertifications() {
    return getSampleCertifications().where((cert) => cert.completedDate != null).toList();
  }

  static List<CertificationModel> getActiveCertifications() {
    final now = DateTime.now();
    return getSampleCertifications()
        .where(
          (cert) => cert.completedDate != null && (cert.expiryDate == null || cert.expiryDate!.isAfter(now)),
        )
        .toList();
  }
}
