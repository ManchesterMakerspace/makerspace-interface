import * as React from "react";
import { Omit } from "react-redux";

import { Permission, MemberPermissions } from "app/entities/permission";
import { getPermissions, getPermissionsForMember, putPermissions } from "api/permissions/transactions";
import { AutonomousTransactionState, useAutonomousTransaction } from "ui/hooks/useAutonomousTransaction";
import { CallTransactionState, useCallTransaction } from "ui/hooks/useCallTransaction";

export interface RenderProps {
  readPermissions: AutonomousTransactionState<string[]>;
  readMemberPermissions: AutonomousTransactionState<MemberPermissions>;
  updateMemberPermissions: CallTransactionState<MemberPermissions>;
}

export interface Props {
  memberId: string;
  render: (props: RenderProps) => JSX.Element;
}

export const PermissionsContainer: React.FC<Props> = ({ memberId, render }) => {
  const readPermissions = useAutonomousTransaction<string[]>(getPermissions, []);
  const readMemberPermissions = useAutonomousTransaction<MemberPermissions>(getPermissionsForMember, [memberId]);
  const updateMemberPermissions = useCallTransaction<MemberPermissions>(putPermissions);

  // Refresh member permissions after update
  React.useEffect(() => {
    if (updateMemberPermissions.called && !updateMemberPermissions.loading && !updateMemberPermissions.error) {
      readMemberPermissions.refresh();
    }
  }, [updateMemberPermissions.loading]);

  return render({
    readPermissions,
    readMemberPermissions,
    updateMemberPermissions: {
      ...updateMemberPermissions,
      call: (permissions: Permission) => updateMemberPermissions.call(memberId, permissions),
    },
  });
};
