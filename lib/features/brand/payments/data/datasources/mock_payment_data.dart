import '../models/payment_milestone_model.dart';
import '../models/payment_transaction_model.dart';
import 'mock_payment_milestones.dart';

abstract final class MockPaymentData {
  static List<PaymentMilestoneModel> get aaravMilestones =>
      MockPaymentMilestones.aaravMilestones;

  static const String _avatarAarav =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuCUUIB5dgi6hoR0duMniRHBXpi8mGR0LHUJdtp7QFQtuKC9keA_zIc1GmbyeqaqZXXdIC4r3BL63hEf42e13n2jBV8VRIdeENeqPaSY8KlnB3PFR-ge8spXEnLovX6I0UYCh-UNl2TIUqzOCPjqz_jldgwNxB1sVTXEhmeOqmFoWvrb5zMe_-9FBBjxh7KCcwdY-wupGtM5RJ47f4VTz24UJTKzjGIttRG1EjaR9UNxJr4xvpsoupS6';
  static const String _avatarRiya =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuD4aG_IDmUtix7f9uitzgS6HJ__JYggrlC-JrjQH5A2PWhCxOC2qyxhVdvt-SW_LXLQmsssxS9ERs-OzsgvgBP5YrVGXzPhpjgz7iQy7g83szhVTdLccX9vkXwakhNEl5wJGbHn1JdTA7OUipqFE4JarU-1gEze1YaGXGQ-qw1r8YK6vfn_Ws33T8X_XGnxY_UZpX4zkk7ByYPvQpESYKTS8jfibQWGJi52DcGIs85FtOfyT3GrWAdO';
  static const String _avatarKabir =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuD7Rx_A9VpMIusX8alphJ7XN0aom3ncseMjYZnuYBW3Jev6cGMpM7PJ7SMILqOoPYoFTrWGpf7HnDaIck8wrfrmCWOJzigr0S3yX7bsSy5uVagwSEgMQn0nzmZERYycML6awwosKNEHrgeROOdxUtVkV4Jqfr0ulYYiEBmKGyeHBSeNuFxxkTg_SfxzFB0S5Wk2oxIn7PJldBIfEZPaT1Wyv983Wj8PnNuzZx0ZeFx0y7TcRBrSuTOt';
  static const String _avatarAnanya =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuD99LEV8BCN8JgE4wGadlrE_dNhZwFd8nmXG93v94Q5xIEKbJVXPGMnOmaBuj_iKXZMdifdbkMLBotWfZm2LM8P4tI9HI4CXCjqrtvNE09tcJtKp_d1GYbNMxwMM6IWjQv--GjTftmIPwlKKhxyDsKlLljewncKdhv0XpChDpVRR52jkoHhyDfVBf-S03IaVhjvdKs3mh0YqbIf4I6b90KJ0inXw7ZVk0ItqB30j2fKj94lWKRrtSQ9';
  static const String _avatarZoya =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAi86ZYjTw8CtRQUI9vji58uU6fI_x3slIx7OYR9g_LBrAS6VPgZpQ3fmMCfzYO6c7lXGyzkoInMffVEXmhC13vCw2tuObWiWZDgtMP2iimELHy3hLuYrTM3bJpwWY3WtPqyzu8R3X4-73gLkFQOeC6ot5cMD-Jgqzn7LlZdzM7yCT9RYRjntO4_oSEIpOi7tpG0YDvMRWqKiZRE5ubJCvJw04RffDkNNquvnJffbUBcCy5a-uA1h2w';

  static final List<PaymentTransactionModel> transactions = [
    PaymentTransactionModel(
      id: 'tx_1',
      paymentId: '#CC89241',
      creatorName: 'Aarav Sharma',
      creatorHandle: '@aarav_style',
      creatorAvatar: _avatarAarav,
      campaignTitle: 'Sneaker Gen-2 Drop',
      milestoneDescription: 'Milestone 2/3 Release',
      amount: 25000,
      status: PaymentTransactionStatus.paid,
      paymentType: PaymentType.milestoneRelease,
      dateText: 'Today, 10:32 AM',
      milestones: aaravMilestones,
    ),
    const PaymentTransactionModel(
      id: 'tx_2',
      paymentId: '#CC89242',
      creatorName: 'Riya Sen',
      creatorHandle: '@riya_sen',
      creatorAvatar: _avatarRiya,
      campaignTitle: 'Luxury Festive Collab',
      milestoneDescription: 'Initial Advance (50%)',
      amount: 30000,
      status: PaymentTransactionStatus.pendingEscrow,
      paymentType: PaymentType.initialAdvance,
      dateText: 'Yesterday, 4:15 PM',
    ),
    const PaymentTransactionModel(
      id: 'tx_3',
      paymentId: '#CC89243',
      creatorName: 'Kabir Mehta',
      creatorHandle: '@kabir_fit',
      creatorAvatar: _avatarKabir,
      campaignTitle: 'Fitness Movement Reel',
      milestoneDescription: 'Final Deliverable Payout',
      amount: 12000,
      status: PaymentTransactionStatus.paid,
      paymentType: PaymentType.finalPayout,
      dateText: 'Oct 22, 2024',
    ),
    const PaymentTransactionModel(
      id: 'tx_4',
      paymentId: '#CC89244',
      creatorName: 'Ananya Verma',
      creatorHandle: '@ananya_tech',
      creatorAvatar: _avatarAnanya,
      campaignTitle: 'Tech Review Unboxing',
      milestoneDescription: 'Script Approval Milestone',
      amount: 8500,
      status: PaymentTransactionStatus.paid,
      paymentType: PaymentType.milestoneRelease,
      dateText: 'Oct 19, 2024',
    ),
    const PaymentTransactionModel(
      id: 'tx_5',
      paymentId: '#CC89245',
      creatorName: 'Zoya Akhtar',
      creatorHandle: '@zoya_travels',
      creatorAvatar: _avatarZoya,
      campaignTitle: 'Himalayan Travel Vlog',
      milestoneDescription: 'Security Deposit',
      amount: 15000,
      status: PaymentTransactionStatus.failed,
      paymentType: PaymentType.refund,
      dateText: 'Oct 15, 2024',
    ),
  ];
}
