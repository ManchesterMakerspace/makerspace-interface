import * as React from "react";
import * as hash from "object-hash";
import { ActionMeta } from "react-select/lib/types";
import { Props as SelectProps } from "react-select/lib/Select";
import isPlainObject from "lodash-es/isPlainObject";

import { Permission } from "app/entities/permission";
import { CreateableSelect } from "ui/common/AsyncSelect";
import ErrorMessage from "ui/common/ErrorMessage";
import {
  RenderProps,
  Props as PermissionsContainerProps,
  PermissionsContainer,
} from "ui/permissions/PermissionsContainer";

interface OptionType {
  label: string;
  value: string;
}

const toOptions = (permissions: string[] | Permission): OptionType[] => {
  if (Array.isArray(permissions)) {
    return permissions.map(permission => ({ label: permission, value: permission }));
  } else if (isPlainObject(permissions)) {
    return Object.entries(permissions).reduce((accumulator, [permission, hasPermission]) => {
      if (hasPermission) {
        accumulator.push({ label: permission, value: permission });
      }

      return accumulator;
    }, []);
  }

  return [];
};

interface Props extends RenderProps {
  updateOnChange?: boolean;
  onChange?: SelectProps["onChange"];
}

const PermissionsSelectView: React.FC<Props> = ({
  readPermissions, readMemberPermissions, updateMemberPermissions, updateOnChange, onChange
}) => {
  const loading = readPermissions.loading || readMemberPermissions.loading || updateMemberPermissions.loading;
  // value is an array when multi-select
  const [value, setValue] = React.useState<Permission>({});
  const onChange_ = (value: OptionType[], action: ActionMeta) => {
    // Assume all previous values are false and then override with true if defined in onChange value
    setValue(prevState => ({
      ...Object.keys(prevState).reduce((accumulator, permission) => {
        accumulator[permission] = false;

        return accumulator;
      }, {}),
      ...value.reduce((accumulator, option) => {
        accumulator[option.value] = true;

        return accumulator;
      }, {}),
    }));

    onChange && onChange(value, action);
  };

  // Sync select value when member permissions data changes
  React.useEffect(() => {
    if (!readMemberPermissions.loading && !readMemberPermissions.error) {
      setValue(readMemberPermissions.data && readMemberPermissions.data.permissions);
    }
  }, [readMemberPermissions.loading]);

  return (
    <>
      <CreateableSelect
        isMulti={true}
        isClearable={true}
        isLoading={loading}
        isDisabled={loading || !!readMemberPermissions.error}
        value={toOptions(value)}
        onChange={onChange_}
        onBlur={() => updateOnChange && updateMemberPermissions.call(value)}
        options={toOptions(readPermissions.data)}
        placeholder={loading && "Loading..." || "No permissions."}
        closeMenuOnSelect={false}
      />
      {updateOnChange && <ErrorMessage error={updateMemberPermissions.error} />}
    </>
  )
};

export const PermissionsSelect: React.FC<
  Pick<PermissionsContainerProps, "memberId"> & Pick<Props, "updateOnChange">
> = props => (
  <PermissionsContainer
    memberId={props.memberId}
    render={renderProps => <PermissionsSelectView {...renderProps} updateOnChange={props.updateOnChange} />}
  />
);
